'use strict';

const async = require('async');
const crypto = require('crypto');
const db = require('./bookshelf');
const uuid = require('node-uuid');
const moment = require('moment');

const ITERATIONS = 100000; // @TODO config


function hashPassword(password, salt, callback) {
  crypto.pbkdf2(password, salt, ITERATIONS, 512, 'sha512', (err, key) => {
    if (err) return callback(err);

    callback(null, key.toString('hex'));
  });
}


function getUser(email, callback) {
  console.log(`Lookup user ${email}`);
  db.models.User.where('email', email).fetch().asCallback(callback);
}

exports.getUserById = function(userId) {
  db.models.User.where('id', userId).fetch().asCallback(callback);
};

exports.create = function createUser(email, password, callback) {
  if (arguments.length === 2 && typeof (password) === 'function') {
    callback = password;
    password = undefined;
  }

  async.auto({
    password: (cb) => {
      if (password) {
        return cb(null, password);
      }

      crypto.randomBytes(32, (err, buf) => {
        cb(err, buf ? buf.toString('hex') : null);
      });
    },

    salt: (cb) => crypto.randomBytes(256, (err, buf) => {
      cb(err, buf ? buf.toString('hex') : null);
    }),

    hashedPassword: ['user', function(data, cb) {
      hashPassword(data.password, data.salt, cb);
    }],

    user: ['hashedPassword', 'salt', (data, cb) => {
      const u = new  db.models.User({
        email: email,
        password: data.hashedPassword,
        salt: data.salt
      });

      u.save().asCallback((err) => {
        cb(err, u);
      });
    }]
  }, (err, data) => {
    callback(err, data && data.user ? data.user : null)
  });
};


exports.login = function login(email, password, callback) {
  async.auto({
    user: (cb)  => getUser(email, cb),

    rateLimit: ['user', (data, cb) => {
      const lastLoginAttempt = moment(data.user.last_login_attempt);
      const now = moment();
      if (now.diff(lastLoginAttempt) < 3000) {
        return cb(new Error('ERR:RATE'));
      }

      cb();
    }],

    hashedPassword: ['user', 'rateLimit', function(data, cb) {
      hashPassword(password, data.user.passwd_salt, cb);
    }],

    checkPassword: ['user', 'hashedPassword', function(data, cb) {
      if (data.user.passwd !== data.hashedPassword) {
        return cb(new Error('ERR:PASSWD'));
      }

      cb();
    }]
  }, function(err, data) {
    const now = new Date();

    if (err) {
      if (err.message === 'ERR:PASSWD') {
        data.user.last_login_attempt = now;
        data.user.save().asCallback((err2) => {
          if (err2) {
            console.error(err2.message, err2);
          }

          callback(err);
        });
      } else {
        callback(err);
      }

    } else {
      data.user.last_login = now;
      data.user.last_login_attempt = now;
      data.user.save().asCallback((err2) => {
        callback(err2, data.user);
      });
    }
  });
};

exports.setPassword = function setPassword(username, password, callback) {
  async.auto({
    user: function(cb) {
      getUser(username, cb);
    },

    // 1 hex digit = 4 bits; we want 64 chars = 256 bits = 32 bytes
    salt: (cb) => crypto.randomBytes(256, (err, buf) => {
      cb(err, buf ? buf.toString('hex') : null);
    }),

    hashedPassword: ['user', function(data, cb) {
      hashPassword(password, data.salt, cb);
    }],

    savePassword: ['user', 'hashedPassword', function(data, cb) {
      const user = data.user;
      user.passwd_salt = data.salt;
      user.passwd = data.hashedPassword;
      user.save().asCallback((err) => {
        cb(err, user);
      });
    }]
  }, function(err, data) {
    if (err) return callback(err);

    callback(null, data.user);
  });
};

exports.createResetToken = function(username, callback) {
  async.auto({
    user: (cb) => getUser(username, cb),

    token: (cb) => cb(null, uuid.v4({ rng: uuid.nodeRNG })),

    saveToken: ['user', 'token', (cb, data) => {
      new db.models.ResetToken().save(
        {
          token: data.token,
          user_id: data.user.id,
          expired: moment().add(1, 'days').toDate()
        },
        { method: 'insert'}
      ).asCallback(cb);
    }]
  }, function(err, data) {
    if (err) {
      console.log(`Failed to create reset token for ${username}`, err);
      return callback(err);
    }

    console.info(`Created token ${data.token} for user ${username}`);
    callback(null, data.user);
  })
};


exports.getUserByToken = function(token, callback) {
  console.log(`Look up user by token ${token}`);
  db.models.ResetToken
    .where('token', token)
    .fetch({ withRelated: ['user'] })
    .asCallback(function(err, tok) {
      console.log(arguments);
      callback(err, tok ? tok.user : null);
    });
};


setInterval(() => {
  db.knex('reset_tokens').where('expired', '<', new Date()).delete();
}, 60000);

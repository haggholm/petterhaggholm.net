'use strict';

const fs = require('fs');
const glob = require('glob');
const path = require('path');
const rootPath = path.resolve(`${__dirname}/../..`);

module.exports = {
  appEntry:
    path.relative(
      `${rootPath}/build`,
      process.env.NODE_ENV === 'production' ?
        glob.sync(path.join(rootPath, 'build', 'client-*.js'))[0] :
        'build/client.js'),

  fontAwesomeVersion: JSON.parse(fs.readFileSync(
    `${rootPath}/node_modules/font-awesome/package.json`, 'utf8')).version,

  sslKey: fs.readFileSync(
    `${rootPath}/sample-keys/phnet3.sample.key.pem`, 'utf8'),

  sslCert: fs.readFileSync(
    `${rootPath}/sample-keys/phnet3.sample.cert.pem`, 'utf8'),

  httpModule: require('spdy')
};

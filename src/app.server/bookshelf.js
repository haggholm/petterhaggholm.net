'use strict';

const knex = require('knex')({
  client: 'postgres',
  connection: {
    host:     '127.0.0.1',
    user:     'petter',
    password: 'bhaemael',
    database: 'petter',
    charset:  'utf8'
  }
});

const bookshelf = require('bookshelf')(knex);


var Book, BookInfo, User, ResetToken, Series, Writer, Volume, Translator, Translation, Language;

Book = bookshelf.Model.extend({
  tableName: 'books',
  idAttribute: 'id',
  volume: function() {
    return this.belongsTo(Volume);
  },
  authors: function() {
    return this.belongsToMany(Writer, 'authors', 'book', 'author');
  },
  translations: function() {
    return this.hasMany(Translation, 'book');
  },
  language: function() {
    return this.belongsTo(Language, 'language_id');
  }/*,
  original_language: function() {
    return this.belongsTo(Language, 'original_language');
  }*/
});

Writer = bookshelf.Model.extend({
  tableName: 'people',
  idAttribute: 'id',
  books: function() {
    return this.hasMany(Book, 'authors', 'book', 'author');
  }
});

Series = bookshelf.Model.extend({
  tableName: 'series',
  idAttribute: 'id'
});

Translation = bookshelf.Model.extend({
  tableName: 'translations',
  idAttribute: 'id',
  book: function() {
    return this.belongsTo(Book);
  },
  language: function() {
    return this.hasOne(Language);
  }
});

Translator = bookshelf.Model.extend({
  tableName: 'translators',
  idAttribute: 'id'
});

Volume = bookshelf.Model.extend({
  tableName: 'volumes',
  idAttribute: 'id',
  series: function() {
    return this.belongsTo(Series);
  }
});

Language = bookshelf.Model.extend({
  tableName: 'languages',
  idAttribute: 'id'
});

BookInfo = bookshelf.Model.extend({
  tableName: 'book_info',
  idAttribute: 'id'
});

User = bookshelf.Model.extend({
  tableName: 'users',
  idAttribute: 'id',
  reset_tokens: function() {
    return this.hasMany(ResetToken);
  }
});

ResetToken = bookshelf.Model.extend({
  tableName: 'reset_tokens',
  idAttribute: 'token',
  user: function() {
    return this.hasOne(User);
  }
});


module.exports = {
  db: bookshelf,
  knex: knex,
  models: {
    User,
    Book,
    BookInfo,
    ResetToken
  },
  collections: {
    Users: bookshelf.Collection.extend({ model: User }),
    Books: bookshelf.Collection.extend({ model: Book }),
    ResetTokens: bookshelf.Collection.extend({ model: ResetToken })
  }
};


/*

class BookInfo(models.Model):
class Meta:
db_table = ''
title = models.CharField(max_length=1024)
english_title = models.CharField(max_length=1024)
sort_title = models.CharField(max_length=1024)
author_info = models.Field()
author_desc = models.Field()
has_review = models.BooleanField(blank=True)
rating = models.IntegerField(blank=True, null=True)
series_id = models.IntegerField()
series_title = models.CharField(max_length=1024)
volume = models.IntegerField()
_authors = None
_author_descriptions = None

@property
def authors(self):
if self._authors is None:
  self._authors = []
for a in self.author_info:
if a is not None:
  (a_id, a_name) = a.split(':', 1)
self._authors.append({'id': a_id, 'name': a_name})
return self._authors

@property
def author_descriptions(self):
if self._author_descriptions is None:
  self._author_descriptions = []
for a in self.author_desc:
if a is not None:
  (a_id, a_name) = a.split(':', 1)
self._author_descriptions.append({'id': a_id, 'name': a_name})
return self._author_descriptions

def save(self):
raise Exception('BookInfo models are readonly')
*/

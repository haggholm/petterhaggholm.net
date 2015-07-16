'use strict';

var knex = require('knex')({
  client: 'postgres',
  connection: {
    host     : '127.0.0.1',
    user     : 'petter',
    password : 'bhaemael',
    database : 'petter',
    charset  : 'utf8'
  }
});

var bookshelf = require('bookshelf')(knex);

module.exports = {
  db: bookshelf,
  models: {}
};

module.exports.models.Book = bookshelf.Model.extend({
  tableName: 'book_info',
  idAttribute: 'id'
});

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

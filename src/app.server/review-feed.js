'use strict';

const _ = require('lodash');
const async = require('async');
const knex = require('knex');
const RSS = require('rss');

const db = require('./bookshelf');
const config = require('../../config');


function getBookItem(book) {
  return {
    title: book.english_title,
    description: book.review,
    url: `${config.rootURL}/books/${book.id}`,
    guid: `book:${book.id}`,
    date: book.review_date
    //enclosure: 'optional object An enclosure object'
  };
}


function getSeriesItem(series) {
  return {
    title: series.title,
    description: series.review,
    url: `${config.rootURL}/series/${series.id}`,
    guid: `series:${series.id}`,
    date: series.review_date
    //enclosure: 'optional object An enclosure object'
  };
}

function getItems(callback) {
  async.auto({
    books: (cb) => {
      db.models.Book.where('review', 'is not', null)
        .fetchAll().asCallback((err, books) => {
          cb(err, err ? null : books.toJSON());
        });
    },
    bookItems: ['books', (data, cb) => {
      cb(null, _.map(data.books, getBookItem))
    }],

    series: (cb) => {
      db.models.Series.where('review', 'is not', null)
        .fetchAll().asCallback((err, series) => {
          cb(err, err ? null : series.toJSON());
        });
    },
    seriesItems: ['series', (data, cb) => {
      cb(null, _.map(data.series, getSeriesItem))
    }]

  }, (err, data) => {
    if (err) return callback(err);

    const items = data.bookItems.concat(data.seriesItems)
      .sort((it1, it2) => {
        const ts1 = it1.date.getTime(),
          ts2 = it2.date.getTime();
        return ts1 === ts2 ? 0 : (ts1 < ts2 ? +1 : -1);
      });
    callback(null, items);
  });
}


exports.xml = function(callback) {
  getItems((err, items) => {
    if (err) return callback(err);

    const reviewFeed = new RSS({
      title: 'petterhaggholm.net/book reviews',
      description: 'Petter’s book reviews',
      // generator: 'optional string Feed generator',
      feed_url: `${config.rootURL}/reviews`,
      site_url: `${config.rootURL}/books`,
      // image_url: 'optional url string Small image for feed readers to use.',
      // docs: 'optional url string Url to documentation on this feed.',
      managingEditor: 'Petter Häggholm <petter@petterhaggholm.net>',
      webMaster: 'Petter Häggholm <petter@petterhaggholm.net>',
      // copyright: 'optional string Copyright information for this feed.',
      language: 'English',
      categories: ['book reviews', 'books', 'reviews', 'reading'],
      // pubDate: 'optional Date object or date string The publication date for content in the feed',
      ttl: 60 * 24, // Cache time (minutes)
      // hub: 'optional PubSubHubbub hub url Where is the PubSubHub hub located.',
      // custom_namespaces: 'optional object Put additional namespaces in element (without 'xmlns:' prefix)',
      // custom_elements: 'optional array Put additional elements'
    });

    _.each(items, (it) => reviewFeed.item(it));

    callback(null, reviewFeed.xml());
  });
};

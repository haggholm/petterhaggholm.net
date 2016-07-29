'use strict';

const m = require('mithril');

function cache(fn) {
  fn._cache = {};
  return function() {
    const key = JSON.stringify(arguments);
    const d = m.deferred();
    if (fn._cache[key]) {
      console.info(`Found ${fn.name}:${key} in cache`);
      d.resolve(fn._cache[key]);
    } else {
      fn.apply(null, arguments)
        .then((val) => {
          fn._cache[key] = val;
          d.resolve(val);
        })
        .catch((err) => d.fail(err));
    }
    return d.promise;
  }
}

module.exports = {
  /**
   * @param {string} [id]
   */
  books: cache(function books(id) {
    return m.request({
      method: 'GET',
      url: id ? `/api/books/${id}` : '/api/books'
    });
  }),

  /**
   * @param {string} [pic]
   */
  gallery: cache(function(pic) {
    return m.request({
      method: 'GET',
      url: pic ? `/api/gallery/${pic}` : '/api/gallery'
    });
  })
};

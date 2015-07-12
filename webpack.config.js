'use strict';

var path = require('path');

var webpack = require('webpack');


module.exports = {
  //cache: true,
  //context: path.join(__dirname, 'app'),
  //target: 'node',
  entry: path.join(__dirname, 'src', 'app.client', 'index.js'),
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'index.[hash].js'
  },

  module: {
    loaders: [
      //{ test: /\.jade$/, loader: "jade" },
      //// => "jade" loader is used for ".jade" files

      //{ test: /\.css$/, loader: "style!css" },
      //// => "style" and "css" loader is used for ".css" files
      //// Alternative syntax:
      //{ test: /\.css$/, loaders: ["style", "css"] },

      {test: /\.(es6|jsx)$/, loaders: ['babel']}
    ]
  },

  plugins: [
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin()
  ]
  //resolve: {
  //  'page.js-express-mapper': './node_modules/page.js-express-mapper',
  //  'page': './node_modules/page',
  //  'page.js-express-mapper': './node_modules/page.js-express-mapper'
  //}
};

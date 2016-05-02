'use strict';

var path = require('path');

var webpack = require('webpack');


module.exports = {
  entry: path.join(__dirname, 'src', 'app.client', 'index.js'),
  devtool: 'source-map',
  output: {
    path: path.join(__dirname, 'build'),
    filename: 'index.[hash].js',
    sourceMapFilename: 'index.[hash].js.map'
  },

  module: {
    loaders: [
      {test: /\.(es6|jsx)$/, loaders: ['babel']},
      {test: /\.json$/, loaders: ['json-loader']}
    ]
  },

  plugins: [
    new webpack.optimize.OccurrenceOrderPlugin(true),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      },
      output: {
        comments: false
      },
      minimize: true,
      sourceMap: true
    })
  ]
};

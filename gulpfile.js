'use strict';

var del = require('del')
  , gulp = require('gulp')
  , gutil = require('gulp-util')
  , gzip = require('gulp-gzip')
  , less = require('gulp-less')
  , hoganCompiler = require('gulp-hogan-compile')
  , rev = require('gulp-rev')
  , runSequence = require('run-sequence')
  , sourcemaps = require('gulp-sourcemaps')
  , webpack = require('webpack');

var LessPluginCleanCSS = require('less-plugin-clean-css')
  , LessPluginAutoPrefix = require('less-plugin-autoprefix');


gulp.task('clean', function(cb) {
  del(['build'], cb);
});

gulp.task('templates', ['clean'], function () {
  return gulp.src('src/templates/**/*.hbs')
    .pipe(hoganCompiler('templates.js', {wrapper: 'commonjs', hoganModule: 'hogan.js'}))
    .pipe(gulp.dest('build'));
});

gulp.task('less', function () {
  var cleancss = new LessPluginCleanCSS({
      advanced: true,
      keepSpecialComments: false,
      //sourceMap: true,
      //target: 'build/css'
    });
  var autoprefix = new LessPluginAutoPrefix({ browsers: ['last 2 versions'] });

  return gulp.src('src/less/**')
    //.pipe(sourcemaps.init())
    .pipe(less({plugins: [autoprefix, cleancss]}))
    //.pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('build/assets'));
});

gulp.task('copy', function() {
  return gulp.src('node_modules/font-awesome/fonts/**')
    .pipe(gulp.dest('build/assets'));
});

gulp.task('webpack', ['templates', 'less'], function (callback) {
  webpack(
    require('./webpack.config'),
    function (err, stats) {
      if (err) {
        throw new gutil.PluginError('webpack', err);
      }
      gutil.log('[webpack]', stats.toString({
        // output options
      }));
      callback();
    });
});

gulp.task('gzip', ['webpack', 'copy', 'less'], function() {
  return gulp.src('build/**')
    .pipe(gzip({append: true}))
    .pipe(gulp.dest('build'));
});

gulp.task('rev', function() {
  return gulp.src(['build/assets/*.css', 'assets/index.js'], {base: 'build/assets'})
    .pipe(rev())
    .pipe(gulp.dest('build/assets'))  // write rev'd assets to build dir
    .pipe(rev.manifest())
    .pipe(gulp.dest('build/assets')); // write manifest to build dir
});


gulp.task('default', function(cb) {
  runSequence(
    'clean',
    ['webpack', 'copy', 'gzip'],
    cb
  );
});

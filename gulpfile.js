'use strict';

var del = require('del')
  , fs = require('fs')
  , gulp = require('gulp')
  , gutil = require('gulp-util')
  , gzip = require('gulp-gzip')
  , less = require('gulp-less')
  , htmlmin = require('gulp-htmlmin')
  , path = require('path')
  , rev = require('gulp-rev')
  , runSequence = require('run-sequence')
  , sourcemaps = require('gulp-sourcemaps')
  , watch = require('gulp-watch');
var wrap = require('gulp-wrap');
var concat = require('gulp-concat');
var msx = require('gulp-msx');

var LessPluginCleanCSS = require('less-plugin-clean-css')
  , LessPluginAutoPrefix = require('less-plugin-autoprefix');


gulp.task('clean', function(cb) {
  return del(['build'], cb);
});

const LESS_FILES = 'src/less/*.{css,less}';
gulp.task('less', function () {
  var cleancss = new LessPluginCleanCSS({
      advanced: true,
      keepSpecialComments: false,
      //sourceMap: true,
      //target: 'build/css'
    });
  var autoprefix = new LessPluginAutoPrefix({ browsers: ['last 2 versions'] });

  return gulp.src(LESS_FILES)
    .pipe(sourcemaps.init())
    .pipe(less({plugins: [autoprefix, cleancss]}))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('build/assets'))
    .pipe(gulp.dest('build/'));
});
gulp.task('watch-less', function() {
  return watch(LESS_FILES, runSequence('less'));
});



gulp.task('gallery', function() {
  return gulp.src('src/gallery/**')
             .pipe(gulp.dest('build/gallery'));
});

gulp.task('copy', function() {
  return gulp.src('node_modules/font-awesome/fonts/**')
    .pipe(gulp.dest('build/assets'));
});


gulp.task('gzip', ['copy', 'gallery', 'less'], function() {
  return gulp.src('build/**')
    .pipe(gzip({append: true}))
    .pipe(gulp.dest('build'));
});

gulp.task('rev', function() {
  return gulp.src(['build/**/*.{css,js}'], {base: 'build/'})
    .pipe(rev())
    .pipe(gulp.dest('build/'))  // write rev'd assets to build dir
    .pipe(rev.manifest())
    .pipe(gulp.dest('build/')); // write manifest to build dir
});

function transformJSX() {
  return gulp.src('./src/**/*.jsx')
    .pipe(msx({harmony: true}))
    .pipe(gulp.dest('./src'))
}
gulp.task('transform-jsx', transformJSX);
gulp.task('watch-jsx', function() {
  return watch('./src/**/*.jsx', transformJSX);
});


(function browserifyStuff() {
  const buffer = require('vinyl-buffer');
  const source = require('vinyl-source-stream');
  const browserify = require('browserify');
  const babelify = require('babelify');
  const watchify = require('watchify');
  const uglify = require('gulp-uglify');
  const envify = require('gulp-envify');

  const browserifyOpts = {
    entries: ['./src/app.client/index.js'],
    debug: true
  };
  const opts = Object.assign({}, watchify.args, browserifyOpts);
  const b = watchify(browserify(opts))
    .transform(babelify, {presets: ['es2015']});

  b.on('update', bundle); // on any dep update, runs the bundler
  b.on('log', gutil.log); // output build logs to terminal

  function bundle() {
    gutil.log('Rebuild Browserify bundle');
    return b.bundle()
      // log errors if they happen
      .on('error', gutil.log.bind(gutil, 'Browserify Error'))
      .pipe(source('client.js'))
      .pipe(buffer())
      .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
      .pipe(uglify())
      .pipe(sourcemaps.write('./')) // writes .map file
      .pipe(gulp.dest('./build'));
  }

  gulp.task('browserify', bundle);
})();



gulp.task('default', function(cb) {
  return runSequence(
    ['clean'],
    ['transform-jsx'],
    ['browserify', 'copy', 'less'],
    ['watch-jsx', 'watch-less'],
    cb
  );
});

gulp.task('build', function(cb) {
  return runSequence(
    ['clean'],
    ['transform-jsx'],
    ['browserify', 'copy', 'less'],
    ['rev'],
    ['gzip'],
    cb
  );
});

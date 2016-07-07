var gulp         = require('gulp');
var handleErrors = require('../lib/handleErrors');
var stylus       = require('gulp-stylus');
var config       = require('../config/stylus');
var gutil        = require('gulp-util');
var minifyCSS    = require('gulp-minify-css');
var concatCss    = require('gulp-concat-css');
var autoprefixer = require('gulp-autoprefixer');
var browserSync  = require('browser-sync');
var gulpif       = require('gulp-if');
var livereload = require('gulp-livereload');


gulp.task('stylus', function () {
	var comp = (process.env.NODE_ENV == 'development') ? false : true;
	gutil.log('stylus config.env : ' + process.env.NODE_ENV+'  comp = '+comp);
	gulp.src(config.src)
	.pipe(stylus({
		compress: comp
	}))
	.on('error', handleErrors)
	.pipe(autoprefixer().on('error', handleErrors))
    .pipe(concatCss('style.css'))
	.pipe(gulpif(comp, minifyCSS()))
	.pipe(gulp.dest(config.dest))
	.pipe(livereload());
    // .pipe(browserSync.reload({stream:true}));
});
var config       = require('../config/stylus');

var gulp         = require('gulp');
var stylus       = require('gulp-stylus');
var sourcemaps   = require('gulp-sourcemaps');
var handleErrors = require('../lib/handleErrors');
var gutil = require('gulp-util');
var minifyCSS = require('gulp-minify-css');
var concatCss = require('gulp-concat-css');
// var autoprefixer = require('gulp-autoprefixer');

var autoprefixer = require('autoprefixer-stylus');

/*
gulp.task('stylus', function () {
	gutil.log('stylus ???? config.src : '+config.src+  '  config.env : ' + process.env.NODE_ENV);
	gulp.src(config.src)
	.pipe(stylus({
			use: [autoprefixer('iOS >= 2', '> 0%', 'ie 8', 'ie 9', 'Safari', 'Firefox', 'Opera 12.1')]
		}).on('error', handleErrors))
    // .pipe(autoprefixer('last 4 versions', '> 0%', 'ie 8', 'ie 9', 'Safari', 'Firefox', 'Opera 12.1').on('error', handleErrors))
    .pipe(concatCss('style.css'))
	//.pipe(minifyCSS())
	.pipe(gulp.dest(config.dest));
	gulp.src(config.srcadmin)
	.pipe(stylus({
		compress: false
	}))
	.on('error', handleErrors)
	.pipe(autoprefixer().on('error', handleErrors))
    .pipe(concatCss('admin.css'))
	.pipe(minifyCSS())
	.pipe(gulp.dest(config.dest));
	gulp.src(config.srcfont)
	.pipe(stylus({
		compress: false
	}))
	.on('error', handleErrors)
	.pipe(autoprefixer().on('error', handleErrors))
    .pipe(concatCss('font.css'))
	.pipe(gulp.dest(config.dest));
});
*/

var gulp = require('gulp');
var stylus = require('gulp-stylus');

var autoprefixer = require('autoprefixer-stylus');
gulp.task('stylus', function () {
	gulp.src(config.src)
	.pipe(stylus({
		use: [autoprefixer('> 0%')]
	}))
	.pipe(concatCss('style.css'))
	.pipe(minifyCSS({keepSpecialComments : 1}))
	.pipe(gulp.dest(config.dest));
	gulp.src(config.srcfont)
	.pipe(stylus({
		use: [autoprefixer('> 0%')]
	}))
	.on('error', handleErrors)
	.pipe(concatCss('font.css'))
	.pipe(gulp.dest(config.dest));
	gulp.src(config.src_custom_editor)
	.pipe(stylus({
		use: [autoprefixer('> 0%')]
	}))
	.on('error', handleErrors)
	.pipe(concatCss('custom-editor-style.css'))
	.pipe(gulp.dest(config.dest));
});

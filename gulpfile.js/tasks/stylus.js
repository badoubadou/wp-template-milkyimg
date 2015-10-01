var gulp         = require('gulp');
var stylus       = require('gulp-stylus');
// var browserSync  = require('browser-sync');
// var sass         = require('gulp-sass');
var sourcemaps   = require('gulp-sourcemaps');
var handleErrors = require('../lib/handleErrors');
var config       = require('../config/stylus');
var gutil = require('gulp-util');
var minifyCSS = require('gulp-minify-css');

var concatCss = require('gulp-concat-css');
// var autoprefixer = require('gulp-autoprefixer');

// gulp.task('sass', function () {
//   return gulp.src(config.src)
//     .pipe(sourcemaps.init())
//     .pipe(sass(config.settings))
//     .on('error', handleErrors)
//     .pipe(sourcemaps.write())
//     .pipe(autoprefixer(config.autoprefixer))
//     .pipe(gulp.dest(config.dest))
//     .pipe(browserSync.reload({stream:true}));
// });


gulp.task('stylus', function () {
	gutil.log('stylus ???? config.src : '+config.src+  '  config.env : ' + process.env.NODE_ENV);
	gulp.src(config.src)
	.pipe(stylus({
		compress: false
	}))
	.on('error', handleErrors)
	.pipe(concatCss('style.css'))
	.pipe(minifyCSS())
	.pipe(gulp.dest(config.dest));
	gulp.src(config.srcadmin)
	.pipe(stylus({
		compress: false
	}))
	.on('error', handleErrors)
	.pipe(concatCss('admin.css'))
	.pipe(minifyCSS())
	.pipe(gulp.dest(config.dest));
});
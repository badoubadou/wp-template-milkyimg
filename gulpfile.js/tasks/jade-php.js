var browserSync  = require('browser-sync');
var config       = require('../config/jade-php');
var gulp         = require('gulp');
var render       = require('gulp-nunjucks-render');
var gulpif       = require('gulp-if');
var handleErrors = require('../lib/handleErrors');
var jadephp = require('gulp-jade-php');
var gutil = require('gulp-util');

gulp.task('jade-php', function() {
	gutil.log('jade-php : '+config.src);
	gulp.src(config.src)
		.pipe(jadephp({
			pretty: false
		}))
		.on('error', handleErrors)
		.pipe(gulp.dest(config.dest));
	gulp.src(config.srcmodule)
		.pipe(jadephp({
			pretty: false
		}))
		.on('error', handleErrors)
		.pipe(gulp.dest(config.destmodule));
});


var gulp         = require('gulp');
var handleErrors = require('../lib/handleErrors');
var config       = require('../config/misc');
var gutil = require('gulp-util');

gulp.task('misc', function () {
	gutil.log('misc');
	gulp.src(config.src)
	.pipe(gulp.dest(config.dest));
	gulp.src(config.srcvendor)
	.pipe(gulp.dest(config.destvendor));
	gulp.src(config.srcdata)
	.pipe(gulp.dest(config.destdata));
	gulp.src(config.srcphp)
	.pipe(gulp.dest(config.destphp));
	gulp.src(config.srcdico)
	.pipe(gulp.dest(config.destdico));
	gulp.src(config.srccloud)
	.pipe(gulp.dest(config.destcloud));
});
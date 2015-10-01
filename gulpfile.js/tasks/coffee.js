var config       = require('../config/coffee');
var gulp         = require('gulp');
var handleErrors = require('../lib/handleErrors');
var gutil        = require('gulp-util');
var coffee       = require('gulp-coffee');
var concat       = require('gulp-concat');
var uglify       = require('gulp-uglify');


gulp.task('coffee', function() {
	gutil.log('coffee : '+config.dest);
	gulp.src(config.src)
		.pipe(coffee())
		.pipe(concat('base.js'))
		.on('error', handleErrors)
		.pipe(gulp.dest(config.dest));
	gulp.src(config.srcadmin)
		.pipe(coffee())
		.pipe(concat('admin.js'))
		.on('error', handleErrors)
		.pipe(gulp.dest(config.dest));
});

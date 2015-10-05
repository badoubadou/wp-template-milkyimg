var config       = require('../config/bower-files');
var gulp         = require('gulp');
var handleErrors = require('../lib/handleErrors');
var gutil = require('gulp-util');

var mbf = require('main-bower-files');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

gulp.task('bower-files', function(){

	// return gulp.src(mainBowerFiles({includeDev: true}))
	// 	.pipe(gulp.dest(config.dest));
	gulp.src(mbf({includeDev: true}).filter(function (f) {
		gutil.log('bower files'+f);
		return f.substr(-2) === 'js';
	}))
	// gulp.src(mbf({includeDev: true}).filter(function (f) { return f.substr(-6) === 'min.js'; }))
    .pipe(concat('vendor.js'))
    .pipe(uglify())
    .pipe(gulp.dest(config.dest));

    gutil.log('bower files css dest'+config.destcss);

    gulp.src(mbf({includeDev: true}).filter(function (f) {
		return f.substr(-3) === 'css';
	}))
	.pipe(gulp.dest(config.destcss));

	// gulp.src(mbf('**/*.ttf'))
	// .pipe(gulp.dest(config.destfont));


});
var browserSync  = require('browser-sync');
var config       = require('../config/jade-php');
var gulp         = require('gulp');
var render       = require('gulp-nunjucks-render');
var gulpif       = require('gulp-if');
var handleErrors = require('../lib/handleErrors');
var jadephp = require('gulp-jade-php');
var gutil = require('gulp-util');

// gulp.task('jade-php', function() {
//   render.nunjucks.configure(config.nunjucks, {watch: false });
//   return gulp.src(config.src)
//     .pipe(render())
//     .pipe(jadephp())
//     .on('error', handleErrors)
//     .pipe(gulp.dest(config.dest))
//     .pipe(browserSync.reload({
//       stream: true
//     }));
// });
// gulp.task('json-test', function() {
//   return gulp.src('./examples/test1.jade')
//     .pipe(data(function(file) {
//       return require('./examples/' + path.basename(file.path) + '.json');
//     }))
//     .pipe(jade())
//     .pipe(gulp.dest('build'));
// });

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


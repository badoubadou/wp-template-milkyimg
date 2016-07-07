var gulp      = require('gulp');
var html      = require('../config/html');
var jadephp   = require('../config/jade-php');
var iconFont  = require('../config/iconFont');
var svgSprite = require('../config/svg-sprite');
var images    = require('../config/images');
var sass      = require('../config/sass');
var stylus      = require('../config/stylus');
var misc      = require('../config/misc');
var fonts     = require('../config/fonts');
var coffee     = require('../config/coffee');
var watch     = require('gulp-watch');
var livereload = require('gulp-livereload');

gulp.task('watch', ['browserSync'], function() {
	var server = livereload.listen();
	watch(images.src, function() { gulp.start('images'); });
	watch(sass.src, function() { gulp.start('sass'); });
	watch(iconFont.src, function() { gulp.start('iconFont'); });
	watch(svgSprite.src, function() { gulp.start('svg-sprite'); });
	watch(fonts.src, function() { gulp.start('fonts'); });
	// watch(html.watch, function() { gulp.start('html'); });
	watch(jadephp.watch, function() { gulp.start('jade-php'); });
	watch(stylus.watch, function() { gulp.start('stylus'); });
	watch(misc.watch, function() { gulp.start('misc'); });
	watch(coffee.watch, function() { gulp.start('coffee'); });
});

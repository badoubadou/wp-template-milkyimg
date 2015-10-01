var gulp         = require('gulp');
var gulpSequence = require('gulp-sequence');

gulp.task('build:development', function(cb) {
  // gulpSequence('clean', ['fonts', 'iconFont', 'images', 'svg-sprite'], ['sass', 'webpack:development', 'jade-php'], cb)
  // gulpSequence('clean', ['fonts', 'iconFont', 'images', 'svg-sprite', 'misc', 'bower-files'], ['stylus', 'webpack:development', 'jade-php'], cb)
  gulpSequence('clean', ['fonts', 'iconFont', 'images', 'svg-sprite', 'misc', 'bower-files'], ['stylus', 'coffee', 'jade-php'], cb);
});

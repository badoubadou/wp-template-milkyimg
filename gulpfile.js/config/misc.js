var config = require('./');

module.exports = {
  // watch: [config.sourceDirectory + '/php/*',config.sourceDirectory + '/data/*',config.sourceDirectory + '/*',config.sourceDirectory + '/.*'],
  watch: [
    config.sourceDirectory + '/core/php/*',
    config.sourceDirectory + '/*',
    config.sourceDirectory + '/.*'
  ],
  src: [
  config.sourceDirectory + '/*',
  config.sourceDirectory + '/.*',
  '!' + config.sourceDirectory + '/core',
  '!' + config.sourceDirectory + '/page',
  '!' + config.sourceDirectory + '/core/jade',
  '!' + config.sourceDirectory + '/assets',
  '!' + config.sourceDirectory + '/sprites',
  '!' + config.sourceDirectory + '/icons'
  ],
  dest: config.publicDirectory ,
  srcvendor: [config.sourceDirectory + '/core/js/vendor/*'],
  destvendor: config.publicDirectory + '/js/vendor/',
  srcphp: [config.sourceDirectory + '/core/php/*'],
  destphp: config.publicDirectory + '/'
};


// gulp.task('misc', function() {
//     //grab everything, which should include htaccess, robots, etc
//     gulp.src('app/*')
//         .pipe(gulp.dest('dist'));

//     //grab any hidden files too
//     gulp.src('app/.*')
//         .pipe(gulp.dest('dist'));

//     gulp.src('app/fonts/**/*')
//         .pipe(gulp.dest('dist/fonts'));

//     //grab all of the styles
//     gulp.src(['app/styles/*.css', '!app/styles/styles.css'])
//         .pipe(gulp.dest('dist/styles'));
// });
var config = require('./');

module.exports = {
  // watch: [config.sourceDirectory + '/php/*',config.sourceDirectory + '/data/*',config.sourceDirectory + '/*',config.sourceDirectory + '/.*'],
  watch: [
    config.sourceDirectory + '/core/php/*',
    '!' + config.sourceDirectory + '/data/*',
    config.sourceDirectory + '/*',
    config.sourceDirectory + '/.*',
    config.sourceDirectory + '/core/dico/*'
  ],
  src: [
  config.sourceDirectory + '/*',
  config.sourceDirectory + '/.*',
  '!' + config.sourceDirectory + '/core/jade',
  '!' + config.sourceDirectory + '/assets',
  '!' + config.sourceDirectory + '/sprites',
  '!' + config.sourceDirectory + '/icons',
  '!' + config.sourceDirectory + '/data',
  config.sourceDirectory + '/core/dico/*'
  ],
  dest: config.publicDirectory ,
  srcvendor: [config.sourceDirectory + '/core/js/vendor/*'],
  destvendor: config.publicDirectory + '/js/vendor/',
  srcdico: [config.sourceDirectory + '/core/dico/*'],
  destdico: config.publicDirectory + '/dico/',
  srcdata: [config.sourceDirectory + '/data/*'],
  destdata: config.publicDirectory + '/data/',
  srcphp: [config.sourceDirectory + '/core/php/*'],
  destphp: config.publicDirectory + '/php/',
  srccloud: [config.sourceDirectory + '/cloud/**/*'],
  destcloud: config.publicDirectory + '/cloud/',
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
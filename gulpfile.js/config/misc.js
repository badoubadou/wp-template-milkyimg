var config = require('./');

module.exports = {
  // watch: [config.sourceDirectory + '/php/*',config.sourceDirectory + '/data/*',config.sourceDirectory + '/*',config.sourceDirectory + '/.*'],
  watch: [config.sourceDirectory + '/php/*', '!' + config.sourceDirectory + '/data/*', config.sourceDirectory + '/*', config.sourceDirectory + '/.*', config.sourceDirectory + '/dico/*'],
  src: [config.sourceDirectory + '/*', config.sourceDirectory + '/.*', '!' + config.sourceDirectory + '/jade', '!' + config.sourceDirectory + '/assets', '!' + config.sourceDirectory + '/sprites', '!' + config.sourceDirectory + '/stylesheets', '!' + config.sourceDirectory + '/html', '!' + config.sourceDirectory + '/icons','!' + config.sourceDirectory + '/data',config.sourceDirectory + '/dico/*'],
  dest: config.publicDirectory ,
  srcvendor: [config.sourceDirectory + '/js/vendor/*'],
  destvendor: config.publicDirectory + '/js/vendor/',
  srcdico: [config.sourceDirectory + '/dico/*'],
  destdico: config.publicDirectory + '/dico/',
  srcdata: [config.sourceDirectory + '/data/*'],
  destdata: config.publicDirectory + '/data/',
  srcphp: [config.sourceDirectory + '/php/*'],
  destphp: config.publicDirectory + '/php/',
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
var config = require('./');

module.exports = {
  watch: [
  config.sourceDirectory + '/core/js/**/*.coffee',
  config.sourceDirectory + '/module/**/*.coffee'
  ],
  src: [
  config.sourceDirectory + '/core/js/module.coffee',
  config.sourceDirectory + '/module/**/*.coffee',
  config.sourceDirectory + '/core/js/**/*.coffee',
  '!' + config.sourceDirectory + '/core/js/admin/*.coffee',
  '!' + config.sourceDirectory + '/core/js/admin.coffee'
  ],
  vendor: [
  config.sourceDirectory + '/core/js/vendor/**/*',
  '!' + config.sourceDirectory + '/core/js/vendor/modernizr-2.8.3.min.js',
  config.publicDirectory + '/js/base.js'//// c'est le js généré après le coffee (c'est degeu comme methode)
  ],
  dest: config.publicDirectory + '/js/'
};

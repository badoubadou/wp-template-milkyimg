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
  srcadmin: [
  config.sourceDirectory + '/core/js/module.coffee',
  config.sourceDirectory + '/module/**/*.coffee',
  config.sourceDirectory + '/core/js/admin/*.coffee',
  config.sourceDirectory + '/core/js/**/admin.coffee'
  ],
  destadmin: config.publicDirectory + '/js/',
  dest: config.publicDirectory + '/js/'
};

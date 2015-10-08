var config = require('./');

module.exports = {
  watch: [
  config.sourceDirectory + '/js/**/*.coffee',
  config.sourceDirectory + '/module/**/*.coffee'
  ],
  src: [
  config.sourceDirectory + '/js/module.coffee',
  config.sourceDirectory + '/module/**/*.coffee',
  config.sourceDirectory + '/js/**/*.coffee',
  '!' + config.sourceDirectory + '/js/admin/*.coffee',
  '!' + config.sourceDirectory + '/js/admin.coffee'
  ],
  srcadmin: [
  config.sourceDirectory + '/js/module.coffee',
  config.sourceDirectory + '/module/**/*.coffee',
  config.sourceDirectory + '/js/admin/*.coffee',
  config.sourceDirectory + '/js/**/admin.coffee'
  ],
  destadmin: config.publicDirectory + '/js/',
  dest: config.publicDirectory + '/js/'
};

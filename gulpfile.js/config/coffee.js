var config = require('./');

module.exports = {
  watch: config.sourceDirectory + '/js/**/*.coffee',
  src: [config.sourceDirectory + '/js/**/*.coffee', '!' + config.sourceDirectory + '/js/admin/*.coffee', '!' + config.sourceDirectory + '/js/admin.coffee'],
  dest: config.publicDirectory + '/js/',
  srcadmin: [config.sourceDirectory + '/js/module.coffee', config.sourceDirectory + '/js/admin/*.coffee', config.sourceDirectory + '/js/**/admin.coffee'],
  destadmin: config.publicDirectory + '/js/'
};

var config = require('./');

module.exports = {
  watch: config.sourceDirectory + '/css/**/*.styl',
  src: [config.sourceDirectory + '/css/**/style.styl'],
  dest: config.publicDirectory + '/css',
  srcadmin: [config.sourceDirectory + '/css/**/admin.styl']
};

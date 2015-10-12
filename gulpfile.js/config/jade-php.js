var config = require('./');

module.exports = {
  watch: [
  config.sourceDirectory + '/core/jade/**/*.jade',
  config.sourceDirectory + '/module/**/*.jade'
  ],
  src: [
  config.sourceDirectory + '/core/jade/**/*.jade',
  '!**/{layouts,shared,macros,includes}/**',
  '!/**/layout.jade'
  ],
  srcmodule: [
  config.sourceDirectory + '/module/**/*.jade'
  ],
  dest: config.publicDirectory,
  destmodule: config.publicDirectory+'/module/',
  nunjucks: [config.sourceDirectory + '/core/jade/'],
  htmlmin: {
    collapseWhitespace: true
  }
};

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
  dest: config.publicDirectory,
  nunjucks: [config.sourceDirectory + '/core/jade/'],
  htmlmin: {
    collapseWhitespace: true
  }
};

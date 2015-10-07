var config = require('./');

module.exports = {
  watch: [
  config.sourceDirectory + '/jade/**/*.jade',
  config.sourceDirectory + '/module/**/*.jade'
  ],
  src: [
  config.sourceDirectory + '/jade/**/*.jade',
  '!**/{layouts,shared,macros,includes}/**',
  '!/**/layout.jade'
  ],
  dest: config.publicDirectory,
  nunjucks: [config.sourceDirectory + '/jade/'],
  htmlmin: {
    collapseWhitespace: true
  }
};

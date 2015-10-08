var config = require('./');

module.exports = {
  src:  './bower_components',
  dest:  config.publicDirectory + '/js/',
  destcss:  config.sourceDirectory + '/core/css/vendor/',
  destfont:  config.sourceDirectory + '/fonts/'
};

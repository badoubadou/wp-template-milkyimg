var config = require('./')
var fontConfig = require('./fonts')

module.exports = {
  name: 'Gulp Starter Icons',
  src: config.sourceAssets + '/icons/*.svg',
  dest: fontConfig.dest,
  sassDest: config.sourceAssets + '/css/generated',
  // template: './gulpfile.js/tasks/iconFont/template.sass',
  template: './gulpfile.js/tasks/iconFont/template.styl',
  sassOutputName: '_icons.styl',
  fontPath: '../fonts',
  className: 'icon',
  options: {
    svg: true,
    timestamp: 0, // see https://github.com/fontello/svg2ttf/issues/33
    fontName: 'icons',
    appendUnicode: true,
    normalize: false
  }
}

// Generated by CoffeeScript 1.10.0
var replaceimg;

replaceimg = (function() {
  function replaceimg($btn) {
    this.$btn = $btn;
    this.setOptions();
    this.bindEvents();
  }

  replaceimg.prototype.setOptions = function() {
    return this.$btn = this.$btn;
  };

  replaceimg.prototype.getContext = function($el) {
    this.$el = $el;
    return this.$newsrc = this.$el.attr('src').replace('mini-me-', '');
  };

  replaceimg.prototype.bindEvents = function() {
    return this.$btn.on('click', (function(_this) {
      return function(event) {
        console.log('click replaceimg');
        _this.getContext($(event.currentTarget));
        $('.target').attr('src', _this.$newsrc);
        $('.target').removeClass('target');
        $('.server').addClass('hidden');
        $('body').removeClass('popin');
        return $('body').addClass('savable');
      };
    })(this));
  };

  return replaceimg;

})();

module.replaceimg = replaceimg;
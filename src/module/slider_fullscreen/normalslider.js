// Generated by CoffeeScript 1.10.0
var slidernormal;

slidernormal = (function() {
  function slidernormal() {}

  return slidernormal;

})();

({
  constructor: function($container) {
    this.$container = $container;
    console.log('sdqsdqsd');
    this.setOptions();
    this.bindEvents();
    return {
      init: (function(_this) {
        return function() {
          _this.$flexslider.flexslider;
          return {
            animation: 'slide',
            animationSpeed: 400,
            smoothHeight: false,
            slideshow: false,
            after: function() {
              return _this.replaceLowRes();
            }
          };
        };
      })(this),
      setOptions: function() {
        return this.$flexslider = this.$container.find('.flexslider');
      },
      replaceLowRes: function() {
        this.$activeSlider = this.$flexslider.find('.flex-active-slide');
        this.$img = this.$activeSlider.find('img');
        this.$normalsrc = this.$img.data('file-path');
        this.$filereplaced = this.$img.data('file-replaced');
        if (this.$filereplaced === 'false') {
          this.$img.attr('src', this.$normalsrc);
          return this.$img.data('file-replaced', 'true');
        }
      },
      bindEvents: function() {
        return this.init();
      }
    };
  }
});

module.slidernormal = slidernormal;
// Generated by CoffeeScript 1.10.0
var slider;

slider = (function() {
  function slider($btn) {
    this.$btn = $btn;
    this.slider = $('.flexslider');
    this.bindEvents();
  }

  slider.prototype.bindEvents = function() {
    console.log('flexsliderflexsliderflexsliderflexslider');
    $('.flexslider').flexslider({
      animation: 'slide'
    });
  };

  return slider;

})();

module.slider = slider;

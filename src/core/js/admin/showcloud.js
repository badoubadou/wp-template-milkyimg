// Generated by CoffeeScript 1.10.0
var showcloud;

showcloud = (function() {
  function showcloud($btn, othertarget) {
    this.$btn = $btn;
    this.othertarget = othertarget;
    this.setOptions();
    this.bindEvents();
  }

  showcloud.prototype.setOptions = function() {
    return this.$btn = this.$btn;
  };

  showcloud.prototype.bindEvents = function() {
    return this.$btn.on('click', function(event) {
      console.log('click showcloud');
      if ($(this).is('img')) {
        $(this).addClass('target');
      } else {
        console.log($(this).parent().html() + 'music');
        $(this).parent().find('.audioplayer').addClass('target');
      }
      $('.server').removeClass('hidden');
      $('body').addClass('popin');
      return $('.server img').each(function() {
        return $(this).attr('src', $(this).data('src'));
      });
    });
  };

  return showcloud;

})();

module.showcloud = showcloud;

// Generated by CoffeeScript 1.10.0
var updatecolsize;

updatecolsize = (function() {
  function updatecolsize($container, $level) {
    this.$container = $container;
    this.$level = $level;
    this.update(this.$container, this.$level);
  }

  updatecolsize.prototype.update = function($container, $level) {
    var nbel, newclasscol, newnum;
    this.$container = $container;
    this.$level = $level;
    nbel = this.$container.find('.blocks.level-' + this.$level).length;
    if (nbel === 2 && this.$container.find('.blocks.level-' + this.$level).first().hasClass('perso') && this.$container.find('.blocks.level-' + this.$level).last().hasClass('txt')) {
      this.$container.find('.perso').removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass('col-10').data('column', 'col-10');
      return this.$container.find('.txt').removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass('col-2').data('column', 'col-2');
    } else {
      newnum = Math.round((12 / nbel) * 10) / 10;
      newclasscol = ('col-' + newnum).replace('.', '-');
      return this.$container.find('.level-' + this.$level).each(function(index) {
        $(this).removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass(newclasscol).data('column', newclasscol);
      });
    }
  };

  return updatecolsize;

})();

module.updatecolsize = updatecolsize;

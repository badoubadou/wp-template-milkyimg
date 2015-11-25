// Generated by CoffeeScript 1.10.0
var removeperso;

removeperso = (function() {
  function removeperso($btn) {
    this.$btn = $btn;
    this.bindEvents();
  }

  removeperso.prototype.getContext = function($el) {
    this.$el = $el;
    return this.$thisblock = this.$el.parent();
  };

  removeperso.prototype.removeBlock = function() {
    $('.persons').sortable('destroy');
    this.$thisblock.remove();
    if (this.$need_update_col_size) {
      new module.updatecolsize(this.$grid, this.$data_level);
    }
    $('.persons').sortable({
      handle: '.moveperso'
    });
    return $('body').addClass('savable');
  };

  removeperso.prototype.bindEvents = function() {
    return this.$btn.on('click', (function(_this) {
      return function(event) {
        console.log('click');
        _this.getContext($(event.currentTarget));
        return _this.removeBlock();
      };
    })(this));
  };

  return removeperso;

})();

module.removeperso = removeperso;

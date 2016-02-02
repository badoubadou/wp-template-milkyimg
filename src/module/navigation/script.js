// Generated by CoffeeScript 1.10.0
var navigation;

navigation = (function() {
  function navigation($container) {
    this.$container = $container;
    this.setOptions();
    this.navGroupWrapper = this.$container.find('.nav-group-wrapper');
    this.navItems = this.$container.find('.nav-group li');
    this.bindEvents();
  }

  navigation.prototype.setOptions = function() {
    this.$root = $('html');
    return this.$mobileToggler = this.$container.find('.toggle-burger');
  };

  navigation.prototype.bindEvents = function() {
    this.$container.on('click', '.nav-group a', (function(_this) {
      return function(e) {
        var $target, parentItems;
        console.log('click');
        $target = $(e.target);
        _this.navItems.removeClass('active');
        parentItems = $target.parentsUntil(_this.navGroupWrapper, 'li').addClass('active');
        if (Modernizr.touch) {
          e.preventDefault();
          return window.location = $target.attr('href');
        }
      };
    })(this));
    this.$mobileToggler.on('click', (function(_this) {
      return function(e) {
        var $target;
        $target = $(e.target);
        console.log('click');
        _this.$root.toggleClass('navigation-active');
        return _this.$container.toggleClass('open');
      };
    })(this));
    return $(document).on('switchedBreakpoint', (function(_this) {
      return function(e, breakpoint) {
        if (breakpoint === 'mobile') {
          return _this.$container.addClass('animate');
        } else {
          return _this.$container.removeClass('animate');
        }
      };
    })(this));
  };

  return navigation;

})();

module.navigation = navigation;

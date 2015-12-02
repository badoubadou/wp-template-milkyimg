// Generated by CoffeeScript 1.10.0
var removefile;

removefile = (function() {
  function removefile($btn) {
    this.$btn = $btn;
    this.bindEvents();
    console.log('removefile');
  }

  removefile.prototype.sendpath = function() {
    var impossible, name, path, type;
    impossible = $('.selected_folder').data('deleatimpossible');
    if (impossible) {
      return false;
    }
    type = $('.selected_folder').hasClass('folder') ? 'folder' : 'file';
    name = $('.selected_folder').data('name');
    path = $('.selected_folder').data('path') + name;
    console.log('path ' + path);
    console.log(' sendpath ' + type);
    if (confirm('Voulez-vous supprimer ' + name + ' ?')) {
      return $.ajax({
        type: 'POST',
        url: 'php/remove.php',
        data: {
          'type': type,
          'path': path
        }
      }).done(function(data) {
        console.log('done' + data);
        return $('.selected_folder').remove();
      });
    }
  };

  removefile.prototype.bindEvents = function() {
    return this.$btn.on('click', (function(_this) {
      return function(e) {
        console.log('click');
        return _this.sendpath();
      };
    })(this));
  };

  return removefile;

})();

module.removefile = removefile;

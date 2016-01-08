// Generated by CoffeeScript 1.10.0
var txteditor;

txteditor = (function() {
  function txteditor($container) {
    this.$container = $container;
    this.setOptions();
    this.bindinline();
    this.hackPlaceHolder();
  }

  txteditor.prototype.hackPlaceHolder = function() {
    var txtplaceholder;
    txtplaceholder = $(this.$container).data('ph');
    if (($(this.$container).find('br[data-mce-bogus="1"]').length)) {
      return $(this.$container).find('p:first-child').addClass('placeholder').attr('data-ph', txtplaceholder);
    }
  };

  txteditor.prototype.setOptions = function() {
    this.$select = $(this.$container);
    return console.log('setOptions' + this.$container);
  };

  txteditor.prototype.getCont = function($id) {
    this.$id = $id;
    $('#' + this.$id).find('.placeholder').removeClass('placeholder');
    $('#' + this.$id).find('[data-ph]').removeAttr('data-ph');
    if ($('body').data('idtiny')) {
      this.removetiny();
    }
    console.log($('#' + this.$id).html() + '.getCont ');
    return $('#' + this.$id).html();
  };

  txteditor.prototype.inline = function(el) {
    var $editable_id, d;
    this.el = el;
    console.log(this.$idtiny + '@$idtiny');
    if (!this.el.attr('id')) {
      d = new Date;
      $editable_id = 'editable_' + d.getTime();
      this.el.attr('id', $editable_id);
    } else {
      $editable_id = this.el.attr('id');
    }
    if ($('body').data('idtiny')) {
      this.removetiny($('body').data('idtiny'));
    }
    $('body').data('idtiny', $editable_id);
    return this.init('#' + $editable_id);
  };

  txteditor.prototype.removetiny = function() {
    tinyMCE.EditorManager.execCommand('mceRemoveEditor', true, $('body').data('idtiny'));
    console.log('?? ' + $('body').data('idtiny'));
    return $('body').data('idtiny', false);
  };

  txteditor.prototype.bindinline = function() {
    var _that;
    _that = this;
    this.$select.each(function(index) {
      var d;
      if (!$(this).attr('id')) {
        d = new Date;
        $(this).attr('id', 'editable_' + index + '_' + d.getTime());
      }
    });
    return this.$select.bind('click', function() {
      _that.inline($(this));
    });
  };

  txteditor.prototype.init = function(elid) {
    this.elid = elid;
    console.log(this.$idtiny + ' = @$idtiny init');
    tinyMCE.init({
      selector: this.elid,
      menubar: false,
      paste_auto_cleanup_on_paste: true,
      paste_remove_styles: true,
      paste_remove_styles_if_webkit: true,
      paste_strip_class_attributes: "all",
      plugins: ["link", "paste"],
      content_css: "/css/style.css",
      toolbar: "undo redo | styleselect | bold italic | link",
      style_formats: [
        {
          title: 'Titre',
          block: 'h2'
        }, {
          title: 'Sous-titre',
          block: 'h3'
        }, {
          title: 'Date',
          inline: 'span',
          classes: 'date'
        }, {
          title: 'romhand',
          inline: 'span',
          classes: 'romhand'
        }, {
          title: 'stephhand',
          inline: 'span',
          classes: 'stephhand'
        }
      ],
      setup: function(editor) {
        editor.on('blur', function(e) {
          if (($('#' + editor.id).find('br[data-mce-bogus="1"]').length)) {
            return $('#' + editor.id).find('p:first-child').addClass('placeholder');
          }
        });
        return editor.on('focus', function(e) {
          $('#' + editor.id).find('.placeholder').removeClass('placeholder');
          console.log(editor.id + 'Editor was clicked' + editor.getContent());
          return $('body').addClass('savable');
        });
      }
    });
  };

  return txteditor;

})();

module.txteditor = txteditor;

// Generated by CoffeeScript 1.10.0
var savepage;

savepage = (function() {
  function savepage($container1, $btn, $txtedit) {
    this.$container = $container1;
    this.$btn = $btn;
    this.$txtedit = $txtedit;
    this.setOptions();
    this.bindEvents();
  }

  savepage.prototype.setOptions = function() {
    this.$btn = this.$btn;
    this.$captionedit = this.$captionedit;
    this.$pagejson = {};
    this.$blocks = this.$container.find('.blocks');
    this.$fileurl = $('body').data('pagejson');
    return console.log(this.$fileurl);
  };

  savepage.prototype.updatelist = function() {
    return this.$blocks = this.$container.find('.blocks');
  };

  savepage.prototype.getContentlist = function($container, $txt, $defaultpics, $autre) {
    var $tab, $te;
    $tab = {};
    $te = this.$txtedit;
    $container.find('li').each(function(index, slide) {
      var $imgslide, $imgsrc, classname, i, newtxt, ref, results, tot, txt_content, txtname;
      $imgslide = $(slide).find('img');
      $imgsrc = (ref = $imgslide.attr('src') !== $defaultpics) != null ? ref : {
        "false": $imgslide.attr('src')
      };
      if ($imgsrc) {
        $tab[index] = {};
        $tab[index]['img'] = $imgslide.attr('src');
        tot = $txt.length;
        i = 0;
        results = [];
        while (i < tot) {
          txtname = $txt[i];
          console.log(' $txt[i] : ' + $txt[i]);
          classname = '.' + txtname;
          console.log('classname : ' + classname);
          newtxt = $(slide).find(classname);
          txt_content = $te.getCont(newtxt.attr('id'));
          $tab[index][txtname] = txt_content;
          results.push(i++);
        }
        return results;
      }
    });
    return $tab;
  };

  savepage.prototype.croalContent = function($container, $level) {
    var $tab;
    $tab = {};
    console.log('$txtedit  lenght' + $container.find('.level-' + $level).length);
    $container.find('.blocks.level-' + $level).each((function(_this) {
      return function(index, element) {
        var $content_to_save, $el_class, $el_col, $el_content, $el_id, $el_level, $el_type, $empty, $intro, $sourcemedia, $te, ref;
        $te = _this.$txtedit;
        $el_content = $(element).find('.content:first-child');
        $el_class = $(element).attr('data-more-class').split(' ');
        $el_type = $(element).data('type-module');
        $el_col = $(element).data('column');
        $el_level = $(element).data('type-level');
        $el_id = $(element).attr('id');
        $empty = false;
        $intro = '';
        $sourcemedia = '';
        console.log('$el_class : ' + $el_class + '//// ' + $(element).attr('data-more-class'));
        if ($el_type === 'txt') {
          $content_to_save = $te.getCont($el_content.find('.editable').attr('id'));
          $empty = (ref = $el_content.find('.editable').text() === '') != null ? ref : {
            "true": false
          };
        }
        if ($el_type === 'img') {
          $content_to_save = _this.getContentlist($el_content, ['flex-caption'], 'http://placehold.it/350x150');
          $intro = $te.getCont($el_content.find('.intro').attr('id'));
        }
        if ($el_type === 'music') {
          $content_to_save = $te.getCont($el_content.find('.intro').attr('id'));
          $sourcemedia = $el_content.find('.audioplayer').attr('src');
        }
        if ($el_type === 'perso') {
          $content_to_save = _this.getContentlist($el_content, ['name', 'infos'], 'http://placehold.it/150x150');
        }
        if ($el_type === 'repeater') {
          $content_to_save = _this.croalContent($el_content, $level + 1);
          console.log(JSON.stringify($content_to_save));
        }
        if (!$empty) {
          $tab[$el_id] = {
            'type': $el_type,
            'classes': $el_class,
            'level': $level,
            'column': $el_col,
            'intro': $intro,
            'content': $content_to_save,
            'sourcemedia': $sourcemedia
          };
        }
        return console.log($content_to_save + '  content_to_save ');
      };
    })(this));
    return $tab;
  };

  savepage.prototype.makeJson = function() {
    this.$pagejson = this.croalContent(this.$container, 0);
    console.log(JSON.stringify(this.$pagejson));
    return this.sendJson();
  };

  savepage.prototype.sendJson = function() {
    console.log('sendJson');
    $('body').removeClass('savable');
    return $.ajax({
      type: 'POST',
      url: 'php/changedata.php',
      data: {
        'fileurl': this.$fileurl,
        'content': JSON.stringify(this.$pagejson)
      }
    }).done(function() {
      return location.reload(true);
    });
  };

  savepage.prototype.bindEvents = function() {
    return this.$btn.on('click', (function(_this) {
      return function(e) {
        return _this.makeJson();
      };
    })(this));
  };

  return savepage;

})();

module.savepage = savepage;

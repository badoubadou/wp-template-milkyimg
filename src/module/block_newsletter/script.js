// Generated by CoffeeScript 1.10.0
var newsletter;

newsletter = (function() {
  function newsletter($form) {
    this.$form = $form;
    console.log('constructor : araaaaaaaaaaa   newsletter');
    this.bindEvents();
  }

  newsletter.prototype.bindEvents = function() {
    console.log('newsletter arrrrragf');
    return this.$form.submit(function(e) {
      var _this, data, url;
      _this = $(this);
      url = '/?na=s&ne=' + $(this).find('#email').val();
      data = _this.find('#email').val();
      console.log('url : ' + url);
      $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(response) {
          console.log($(response).filter('#message').html());
          _this.html('yo : ' + response);
        }
      });
      e.preventDefault();
    });
  };

  return newsletter;

})();

module.newsletter = newsletter;

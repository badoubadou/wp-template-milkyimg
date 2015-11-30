// Generated by CoffeeScript 1.10.0
var upload;

upload = (function() {
  var abortHandler, completeHandler, errorHandler;

  function upload($form) {
    this.$form = $form;
    this.bindEvents();
    console.log('fuck');
  }

  upload.prototype.bindEvents = function() {
    var _that;
    _that = this;
    console.log('yooo');
    return this.$form.find('#uploadbtn').bind('click', function() {
      return _that.uploadFile();
    });
  };

  upload.prototype.uploadFile = function() {
    var ajax, file, formdata;
    file = document.getElementById('file1').files[0];
    formdata = new FormData;
    formdata.append('file1', file);
    formdata.append('path', '../images/');
    ajax = new XMLHttpRequest;
    ajax.upload.addEventListener('progress', this.progressHandler, false);
    ajax.addEventListener('load', this.completeHandler, false);
    ajax.addEventListener('error', this.errorHandler, false);
    ajax.addEventListener('abort', this.abortHandler, false);
    ajax.open('POST', 'php/file_upload_parser.php');
    ajax.send(formdata);
  };

  upload.prototype.progressHandler = function(event) {
    var percent;
    document.getElementById('loaded_n_total').innerHTML = 'Uploaded ' + event.loaded + ' bytes of ' + event.total;
    percent = event.loaded / event.total * 100;
    document.getElementById('progressBar').value = Math.round(percent);
    document.getElementById('status').innerHTML = Math.round(percent) + '% uploaded... please wait';
  };

  completeHandler = function(event) {
    console.log('complte');
    document.getElementById('status').innerHTML = event.target.responseText;
    document.getElementById('progressBar').value = 0;
  };

  errorHandler = function(event) {
    document.getElementById('status').innerHTML = 'Upload Failed';
  };

  abortHandler = function(event) {
    document.getElementById('status').innerHTML = 'Upload Aborted';
  };

  return upload;

})();

module.upload = upload;

class upload
	constructor: (@$form) ->
		@bindEvents()
		console.log 'fuck'

	bindEvents: ->
	  _that = @
	  console.log 'yooo'
	  @$form.find('#uploadbtn').bind 'click', ->
	  	_that.uploadFile()

	uploadFile:  ->
	  file = document.getElementById('file1').files[0]
	  # alert(file.name+" | "+file.size+" | "+file.type);
	  formdata = new FormData
	  formdata.append 'file1', file
	  formdata.append 'path', '../images/'
	  ajax = new XMLHttpRequest
	  ajax.upload.addEventListener 'progress', @progressHandler, false
	  ajax.addEventListener 'load', @completeHandler, false
	  ajax.addEventListener 'error', @errorHandler, false
	  ajax.addEventListener 'abort', @abortHandler, false
	  ajax.open 'POST', 'php/file_upload_parser.php'
	  ajax.send formdata
	  return

	progressHandler: (event) ->
	  document.getElementById('loaded_n_total').innerHTML = 'Uploaded ' + event.loaded + ' bytes of ' + event.total
	  percent = event.loaded / event.total * 100
	  document.getElementById('progressBar').value = Math.round(percent)
	  document.getElementById('status').innerHTML = Math.round(percent) + '% uploaded... please wait'
	  return

	completeHandler = (event) ->
	  console.log 'complte'
	  document.getElementById('status').innerHTML = event.target.responseText
	  document.getElementById('progressBar').value = 0
	  return

	errorHandler = (event) ->
	  document.getElementById('status').innerHTML = 'Upload Failed'
	  return

	abortHandler = (event) ->
	  document.getElementById('status').innerHTML = 'Upload Aborted'
	  return

module.upload = upload


# uploadFile = ->
#   file = document.getElementById('file1').files[0]
#   # alert(file.name+" | "+file.size+" | "+file.type);
#   formdata = new FormData
#   formdata.append 'file1', file
#   ajax = new XMLHttpRequest
#   ajax.upload.addEventListener 'progress', progressHandler, false
#   ajax.addEventListener 'load', completeHandler, false
#   ajax.addEventListener 'error', errorHandler, false
#   ajax.addEventListener 'abort', abortHandler, false
#   ajax.open 'POST', 'php/file_upload_parser.php'
#   ajax.send formdata
#   return

# progressHandler = (event) ->
#   document.getElementById('loaded_n_total').innerHTML = 'Uploaded ' + event.loaded + ' bytes of ' + event.total
#   percent = event.loaded / event.total * 100
#   document.getElementById('progressBar').value = Math.round(percent)
#   document.getElementById('status').innerHTML = Math.round(percent) + '% uploaded... please wait'
#   return

# completeHandler = (event) ->
#   document.getElementById('status').innerHTML = event.target.responseText
#   document.getElementById('progressBar').value = 0
#   return

# errorHandler = (event) ->
#   document.getElementById('status').innerHTML = 'Upload Failed'
#   return

# abortHandler = (event) ->
#   document.getElementById('status').innerHTML = 'Upload Aborted'
#   return

class up
	constructor: (@$uploadmodule) ->
		console.log 'upload'
		@$btn = @$uploadmodule.find('#filesToUpload')
		@$filesToUpload = document.getElementById('filesToUpload')
		@$fileList = @$uploadmodule.find('#fileList')
		@setOptions()
		@init()

	setOptions: ->
		@$path = undefined
		@$foldercont = undefined
		@$totalbites = 0
		@$uploadedbites = 0
		@$indexsend = 0
		$('.bulle').removeClass 'visible'
		@$selected_folder = $('.selected_folder')
		@$targetfolder = if @$selected_folder.is('li') then @$selected_folder.parent() else @$selected_folder.find('ul')
		@$path = @$selected_folder.data('path')
		@$list = @$selected_folder.data('list')
		@$check = @$selected_folder.data('check')
		$('.progresslevel').css 'width', '0%'
		$('.progresstotal').css 'width', '0%'
		$('#uploadedbites').val(0)
		$('#totalbites').val(0)
		$('.bulle').removeClass 'visible'
		$('#uploadedbites').value = 0

	setListUpload: ->
		@$fileList.empty()
		i = 0
		while i < @$filesToUpload.files.length
			@$fileList.append '<li>'+@$filesToUpload.files[i].name+'</li>'
			i++

		if !@$fileList.find('li').length
			@$fileList.append '<li>No Files Selected</li>'
		else
			$('.bulle').addClass 'visible'

	setTotalSize: ->
		i = 0
		console.log @$filesToUpload.files[0]
		while i < @$filesToUpload.files.length
			file = @$filesToUpload.files[i]
			@$totalbites += file.size
			i++
		$('#totalbites').val(@$totalbites)
		console.log @$totalbites
		return

	uploadFile: (myfile) ->
		_that = @
		if !myfile
			myfile = @$filesToUpload.files[0]
		if !myfile
			return false
		formdata = new FormData
		formdata.append 'file1', myfile
		ajax = new XMLHttpRequest
		ajax.upload.addEventListener 'progress', @progressHandler, false
		# ajax.addEventListener 'load', @completeHandler, false
		ajax.addEventListener 'load', ((event) ->
		  _that.completeHandler event, _that
		  return
		), false
		ajax.addEventListener 'error', ((event) ->
		  _that.errorHandler event, _that
		  return
		), false
		# ajax.addEventListener 'error', @errorHandler, false
		ajax.addEventListener 'abort', @abortHandler, false
		ajax.open 'POST', 'php/file_upload_parser.php?path='+@$path+'&type='+$('#filesToUpload').data('type')
		ajax.send formdata
		return

	progressHandler: (event) ->
		uploadedbites = parseInt($('#uploadedbites').val()) + parseInt(event.loaded)
		totalbites = parseInt($('#totalbites').val())
		percent = event.loaded / event.total * 100
		percenttotal = uploadedbites / totalbites * 100
		percenttotal = if percenttotal > 100 then 100 else percenttotal

		$('#uploadedbites').val(uploadedbites)
		$('#loaded_n_total').html 'Uploaded ' + uploadedbites/100 + 'KB of ' + totalbites/100 + 'KB'
		$('.progresslevel').css 'width', Math.round(percent) + '%'
		$('.progresstotal').css 'width', Math.round(percenttotal) + '%'
		$('#status').html Math.round(percenttotal) + '% uploaded... please wait'
		return

	updateListServer: (infophp) ->
		@$fileList.find('li:first').remove()#remove file from list update
		$('#'+@$check).prop('checked', true)#open folder
		$('.selected_folder').removeClass 'selected_folder'#open remove highlight

		$newli = $('<li>',
			'data-path': infophp['path'].replace('../', '')
			'data-path-file': infophp['path'].replace('../', '')+ infophp['name']
			'data-type':$('#filesToUpload').data('type')
			class: 'selected_folder')

		$newnamediv = $('<div>',
			class: 'name')

		$newnamediv.text(infophp['name'])

		if($('#filesToUpload').data('type')=='img')
			$newpreviewimg = $('<div>',
				class: 'contimg')

			$img = $('<img>',
				src: (infophp['path'] + infophp['name']))

			$newpreviewimg.append $img

			$newli.append $newpreviewimg


		$newli.append $newnamediv
		@$targetfolder.append $newli

		# @$targetfolder.append '<li data-path="' + infophp['path'].replace('../', '') + '" data-path-file="' + infophp['path'].replace('../', '') + infophp['name'] + '"  data-name="' + infophp['name'] + '" class="selected_folder"><div class="contimg"><img src="' + infophp['path'] + infophp['name'] + '"></div><div class="name">' + infophp['name'] + '</div></li>'
		cloud = new module.cloud($('#cloud')).updatebind($newli)
		return

	completeHandler: (event, param) ->
		console.log 'completeHandler'+event.target.responseText
		stringjson = event.target.responseText.toString()
		infophp = JSON.parse(stringjson)
		param.updateListServer(infophp)
		if(@$filesToUpload.files.length-1>param.$indexsend)
			param.$indexsend += 1
			param.uploadFile(@$filesToUpload.files[param.$indexsend])
		else
			param.setOptions()
		return

	errorHandler: (event, param) ->
		param.$fileList.find('li:first').addClass 'error'
		$('#status').html 'Upload Failed'
		return

	abortHandler: (event) ->
		$('#status').html 'Upload Aborted'
		return

	init: ->
		@bindEvents()

	bindEvents: ->
		console.log 'bind!'
		_that = @
		$('#filesToUpload').change ->
			_that.setOptions()
			_that.setListUpload()
			_that.setTotalSize()
			_that.uploadFile()
			console.log 'changed!'+_that.$totalbites
			return

module.up = up

class cloud
	constructor: (@$cloud) ->
		console.log 'clouad '+ @$cloud.html()
		@setOptions()
		if(@$cloud)
			@bindEvents()

	setOptions: ->
		@$renameinput = $('#renameinput')
		@$folder = @$cloud.find '.folder-trigger'
		@$imgli =  @$cloud.find 'li'
		@$listimg =  @$cloud.find '.listimg'
		@$timer = undefined
		@$needsorting = (@$cloud.attr('id') == 'cloud')

	checkmovment: ->
		newcloud = @$cloud.html()
		$('.cover').addClass('visible')
		_that = @
		$(newcloud).find('.listimg').each ->
			idlist = $(this).attr 'id'
			$(this).find(' > li').each ->
				if idlist != $(this).data 'from-where'
					console.log idlist + ' -- '+ $(this).data('from-where')+ ' -- '+ $(this).data('name')
					oldpath = $('#'+$(this).data('from-where')).data('path')+ $(this).data('name')
					newpath = $('#'+idlist).data('path')+ $(this).data('name')
					_that.updateorder(oldpath, newpath);
				return

	updateorder: (@$oldpath, @$newpath) ->
		console.log @$oldpath+' @$oldpath, '+@$newpath+'+@$newpath'
		$.ajax(
			type:'POST',
			url: 'php/move.php',
			data: {
				'newname': @$newpath
				'oldname': @$oldpath
				}).done (data) ->
			$('.cover').removeClass('visible')
			console.log 'done'+data

	checkmovmentdebounce: ->
		clearTimeout @$timer
		_that = @
		@$timer = setTimeout (->
			_that.checkmovment()
		), 1000
		return

	updateSelect: ($el)->
		$('.previewfile').empty()
		$('#cloud').removeClass('withpreview')
		$('.selected_folder').removeClass('selected_folder')
		$el.addClass('selected_folder')
		path = if $el.is('li') then 'path-file' else 'path'
		$('.showurl').text(window.location.origin+'/'+$('.selected_folder').data(path))
		allowed = 'image/*'
		if ($el.data('type') == 'img')
			allowed = 'image/*'
		if ($el.data('type') == 'pdf')
			allowed = 'application/pdf'
		if ($el.data('type') == 'mp3')
			allowed = 'audio/*'
		if ($el.data('type') == 'video')
			allowed = 'video/*'
		$('#filesToUpload').attr('accept', allowed)
		$('#filesToUpload').attr('data-type', $el.data('type'))
		return

	updatebind: ($el) ->
		_that = @
		$el.on 'click', (event) ->
			_that.updateSelect($(this))
			if ($(this).data('type') == 'img')
				$('.previewfile').append('<img src="'+$(this).data('path-file')+'" />')
				$('#cloud').addClass('withpreview')
			if ($(this).data('type') == 'mp3')
				$('.previewfile').append('<audio controls><source src="'+$(this).data('path-file')+'" type="audio/mpeg"></audio>')
				$('#cloud').addClass('withpreview')
			if ($(this).data('type') == 'video')
				$('.previewfile').append('<video width="300" controls><source src="'+$(this).data('path-file')+'" type="video/mp4"></video>')
				$('#cloud').addClass('withpreview')

	bindEvents: ->
		console.log ('bindEvents clouad'+@$imgli.length)
		_that = @
		@updateSelect($('.folder:first-child'))

		if @$needsorting
			@$listimg.sortable(
				items: ':not(.notsortable)'
				connectWith: '.listimg').bind 'sortupdate',(e) ->
					_that.checkmovmentdebounce()

		@$imgli.on 'click', (event) ->
			_that.updateSelect($(this))
			_that.$cloud.removeClass('withpreview')
			if ($(this).data('type') == 'img')
				$('.previewfile').append('<img src="'+$(this).data('path-file')+'" />')
				_that.$cloud.addClass('withpreview')
			if ($(this).data('type') == 'mp3')
				$('.previewfile').append('<audio controls><source src="'+$(this).data('path-file')+'" type="audio/mpeg"></audio>')
				_that.$cloud.addClass('withpreview')
			if ($(this).data('type') == 'video')
				$('.previewfile').append('<video width="300" controls><source src="'+$(this).data('path-file')+'" type="video/mp4"></video>')
				_that.$cloud.addClass('withpreview')

		@$folder.on 'change', (event) ->
			_that.updateSelect($(this).parent())

module.cloud = cloud

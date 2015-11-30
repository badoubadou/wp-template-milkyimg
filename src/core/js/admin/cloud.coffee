class cloud
	constructor: (@$cloud) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$renameinput = $('#renameinput')
		@$folder = @$cloud.find '.folder-trigger'
		@$imgli =  @$cloud.find 'li'
		@$listimg =  @$cloud.find '.listimg'
		@$timer = undefined

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

	bindEvents: ->
		# console.log 'yo'
		# @$btnbtnrename.on 'click', ->
		# 	$.ajax(
		# 		type:'POST',
		# 		url: 'php/rename.php',
		# 		data: {
		# 			'path': $('.selected_folder').data('path').replace(($('.selected_folder').data('namefolder')+'/'),'')
		# 			'newname': $('#renameinput').val()
		# 			'oldname': $('.selected_folder').data 'namefolder'
		# 			}).done (data) ->
		# 		console.log 'done'+data
		_that = @
		@$listimg.sortable(
			items: ':not(.notsortable)'
			connectWith: '.listimg').bind 'sortupdate',(e) ->
				console.log 'sortupdate'
				_that.checkmovmentdebounce()

		$('.folder:first-child').addClass('selected_folder')
		_that = @
		@$imgli.on 'click', (event) ->
			$('.selected_folder').removeClass('selected_folder')
			$(this).addClass('selected_folder')
			$('.showurl').text(window.location.origin+'/'+$('.selected_folder').data('path-file'))
			$('.previewfile').empty()
			$('#cloud').removeClass('withpreview')
			console.log $(this).data('type')
			if ($(this).data('type') == 'img')
				$('.previewfile').append('<img src="'+$(this).data('path-file')+'" />')
				$('#cloud').addClass('withpreview')
			if ($(this).data('type') == 'mp3')
				$('.previewfile').append('<audio controls><source src="'+$(this).data('path-file')+'" type="audio/mpeg"></audio>')
				$('#cloud').addClass('withpreview')
			if ($(this).data('type') == 'video')
				$('.previewfile').append('<video width="300" controls><source src="'+$(this).data('path-file')+'" type="video/mp4"></video>')
				$('#cloud').addClass('withpreview')


		@$folder.on 'change', (event) ->
			console.log 'licic'
			$('.selected_folder').removeClass('selected_folder')
			$(this).parent().addClass('selected_folder')
			$('.showurl').text(window.location.origin+'/'+$('.selected_folder').data('path'))
			# _that.$renameinput.val($('.selected_folder').data 'name')

			# if $(this).is(':checked')

module.cloud = cloud

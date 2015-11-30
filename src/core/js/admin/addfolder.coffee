class addfolder
	constructor: (@$btn) ->
		@setOptions()
		@bindEvents()
		console.log 'ebb'

	setOptions: ->
		@$btn = @$btn

	sendpath: ->
		@$path = ($('.selected_folder').data 'path')+$('#newfoldername').val()
		console.log 'sendpath'+$('#newfoldername').val()+'??'
		if(!$('#newfoldername').val())
			alert('faut donner un nom à ton dossier')
		else
			$('.cover').addClass('visible')
			console.log 'sendpath'+@$path
			$.ajax(
				type:'POST',
				url: 'php/addfolder.php',
				data: {
					'path': @$path
					}).done (data) ->
				console.log 'done'+data
				# location.reload(true)
				infophp = JSON.parse(data)
				if(infophp[0]=='ok')
					location.reload(true)
					# console.log infophp[1]
					# $('.selected_folder').append('')
					# $('.cover').removeClass('visible')
				# $('.selected_folder').append( "<p>Test</p>" )

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click'
			@sendpath()

module.addfolder = addfolder

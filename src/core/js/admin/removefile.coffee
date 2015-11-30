class removefile
	constructor: (@$btn) ->
		@bindEvents()
		console.log 'removefile'

	sendpath: ->
		type = if $('.selected_folder').hasClass('folder') then 'folder' else 'file'
		name = $('.selected_folder').data 'name'
		path = $('.selected_folder').data('path')+name
		console.log 'path '+ path
		console.log ' sendpath '+type
		if confirm('Voulez-vous supprimer '+name+' ?')
			$.ajax(
				type:'POST',
				url: 'php/remove.php',
				data: {
					'type': type
					'path': path
					}).done (data) ->
				console.log 'done'+data
				$('.selected_folder').remove()

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click'
			@sendpath()

module.removefile = removefile

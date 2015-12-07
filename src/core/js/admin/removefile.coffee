class removefile
	constructor: (@$btn) ->
		@bindEvents()
		console.log 'removefile'

	sendpath: ->
		impossible = $('.selected_folder').data 'deleatimpossible'
		if impossible
			return false
		type = if $('.selected_folder').hasClass('folder') then 'folder' else 'file'
		name = $('.selected_folder').data 'name'
		path = $('.selected_folder').data('path')
		warning = if(type=='folder')  then ('Voulez-vous supprimer le dossier '+name) else ('Voulez-vous supprimer '+name)
		if type == 'file'
			path += name
		else
			warning += ', et tout ce qu\'il contient '
		warning += ' ?'

		console.log 'path '+ path
		console.log ' sendpath '+type
		if confirm(warning)
			$.ajax(
				type:'POST',
				url: 'php/remove.php',
				data: {
					'type': type
					'path': path
					}).done (data) ->
				console.log 'done'+data
				$('.selected_folder').remove()
		return false

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click'
			@sendpath()

module.removefile = removefile

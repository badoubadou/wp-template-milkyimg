class popin
	constructor: (@$btn) ->
		@bindEvents()

	bindform: ->
		console.log 'bind form'
		# $.ajax
		# 	url: 'some-url'
		# 	type: 'post'
		# 	dataType: 'json'
		# 	data: $('form#myForm').serialize()
		# 	success: (data) ->
		# 		console.log 'do something with the data...'
		# 		return

	bindEvents: ->
		_bindform = @bindform
		# activate nav items and their parents when clicked
		$('.mypopin .shield').on 'click', (e) =>
			$('body').removeClass 'popin_opended'

		@$btn.on 'click', (e) =>
			$url = $(e.target).attr 'href'
			$('.mypopin .content').load ($url + ' #main'), (response, status, xhr) ->
				if status == 'error'
					console.log 'Sorry but there was an error: '
				else if status == 'success'
					$('body').addClass 'popin_opended'
					_bindform()
				return

			console.log 'click : '+$url
			return false

module.popin = popin

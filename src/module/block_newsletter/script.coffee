class newsletter
	constructor: (@$form) ->
		console.log 'constructor : araaaaaaaaaaa   newsletter'
		@bindEvents()

	bindEvents: ->
		#--
		console.log 'newsletter arrrrragf'
		@$form.submit (e) ->
			_this = $(this)
			# url = '/?na=s&ne=' + $(this).find('#email').val()
			# console.log 'url : '+ url
			# $('.mypopin .content').load (url + ' #main'), (response, status, xhr) ->
			# 	if status == 'error'
			# 		console.log 'Sorry but there was an error: '
			# 	else if status == 'success'
			# 		console.log 'ok : '+response+'  : '+status+' ???  :'+xhr
			# 	return
			# the script where you handle the form input.
			url = '/?na=s&ne=' + $(this).find('#email').val()
			data = _this.find('#email').val()
			console.log 'url : '+ url
			$.ajax
				type: 'POST'
				url: url
				data: data
				success: (response) ->
					console.log $(response).filter('#message').html()
					# _this.html $(response).filter('#main')
					# show response from the php script.
					_this.html 'yo : '+response
					return
			e.preventDefault()
			return

module.newsletter = newsletter

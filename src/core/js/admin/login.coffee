class login
	constructor: (@$form) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$form.find 'input[type=submit]'

	sendform: ->
		@$login = @$form.find('input[type=text]').val()
		@$pw = @$form.find('input[type=password]').val()
		console.log '@$login'+@$login
		$.ajax(
			type:'POST',
			url: 'php/login.php',
			data: {'login': @$login, 'password': @$pw },
			success: (ret) ->
				location.reload(true)
			)

	bindEvents: ->
		console.log 'bind'
		@$btn.on 'click', (event) =>
			@sendform()
			return false

module.login = login

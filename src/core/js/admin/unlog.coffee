class unlogin
	constructor: (@$btn) ->
		@bindEvents()

	sendform: ->
		$.ajax(
			type:'POST',
			url: 'php/unlog.php',
			success: (ret) ->
				location.reload(true)
			)

	bindEvents: ->
		console.log 'bind unlog'
		@$btn.on 'click', (event) =>
			console.log 'click unlog'
			@sendform()
			return false

module.unlogin = unlogin

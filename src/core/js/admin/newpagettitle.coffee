class newpagename
	constructor: (@$textfield) ->
		@bindEvents()

	onchangetitle: ->
		$makecleanurl = new module.cleanurl(@$textfield.val())
		$newurl = $makecleanurl.cleanstring(@$textfield.val())
		console.log $newurl
		$('body').data( 'pagejson', $newurl)


	bindEvents: ->
		@$textfield.change ->
			console.log 'click'
			@onchangetitle()

module.newpagename = newpagename

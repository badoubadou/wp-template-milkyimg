class filter
	constructor: (@$container) ->
		@select = @$container.find('select')
		@bindEvents()

	bindEvents: ->
		# activate nav items and their parents when clicked
		@select.change (e) =>
			console.log 'changed'
			$string = '?'
			@select.each (index) ->
				if( $(this).find('option:selected').val() != 'label' )
					$string += $(this).attr 'id'
					$string += '=' + $(this).find('option:selected').val()
					$string += '&'
					console.log index + ': ' + $(this).find('option:selected').text()
				return

			$('#main').load $string + ' #main'

module.filter = filter

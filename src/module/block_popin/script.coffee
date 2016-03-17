class popin
	constructor: (@$btn) ->
		@checkbox = $('#showfilterlabel')
		@bindEvents()

	bindEvents: ->
		# activate nav items and their parents when clicked
		$('.mypopin .shield').on 'click', (e) =>
			$('body').removeClass 'popin_opended'

		@$btn.on 'click', (e) =>
			console.log @checkbox.is ':visible'
			if(@checkbox.is ':visible')
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

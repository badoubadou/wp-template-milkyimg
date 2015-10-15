class closecloud
	constructor: (@$btn) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn
		@$cloudfinder = $('.server')

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click'
			@$cloudfinder.addClass 'hidden'
			$('body').removeClass 'popin'
			$('.target').removeClass 'target'

module.closecloud = closecloud
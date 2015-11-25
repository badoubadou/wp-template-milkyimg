class showcloud
	constructor: (@$btn) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn

	bindEvents: ->
		@$btn.on 'click', (event) ->
			console.log 'click showcloud'
			$(event.currentTarget).addClass 'target'
			$('.server').removeClass 'hidden'
			$('body').addClass 'popin'
			console.log 'yodfsdfsdf '

			$('.server img').each ->
				$(this).attr('src',$(this).data('src'))

module.showcloud = showcloud

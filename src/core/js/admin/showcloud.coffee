class showcloud
	constructor: (@$btn, @othertarget) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn

	bindEvents: ->
		@$btn.on 'click', (event) ->
			console.log 'click showcloud'

			if $(this).is 'img'
				$(this).addClass 'target'
			else
				console.log($(this).parent().html()+'music')
				$(this).parent().find('.audioplayer').addClass 'target'

			$('.server').removeClass 'hidden'
			$('body').addClass 'popin'

			$('.server img').each ->
				$(this).attr('src',$(this).data('src'))

module.showcloud = showcloud

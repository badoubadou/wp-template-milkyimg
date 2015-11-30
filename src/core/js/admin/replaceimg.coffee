class replaceimg
	constructor: (@$btn) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn

	getContext: (@$el)->
		@$newsrc = @$el.data('path-file');
		# @$newsrc = @$el.attr('src').replace('mini-me-', '');

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click replaceimg'
			@getContext($(event.currentTarget))
			$('.target').attr('src',@$newsrc)
			$('.target').removeClass 'target'
			$('.server').addClass 'hidden'
			$('body').removeClass 'popin'
			$('body').addClass 'savable'

module.replaceimg = replaceimg

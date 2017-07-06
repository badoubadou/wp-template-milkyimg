class slider
	constructor: (@$btn) ->
		@slider = $('.flexslider')
		@bindEvents()

	bindEvents: ->
		# activate nav items and their parents when clicked
		$('.flexslider').flexslider 
			animation: 'fade'
			direction: 'vertical'
		return


module.slider = slider

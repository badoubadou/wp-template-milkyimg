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
			$('.server img').attr( 'src',$('.server img').data( 'src'))
			# return
		# @$btn.on 'click', (event) =>
		#   console.log 'click showcloud'
		#   $(event.currentTarget).addClass 'target'
		# 	@$cloudfinder.removeClass 'hidden'
		# 	$('body').addClass 'popin'
		#   return

module.showcloud = showcloud

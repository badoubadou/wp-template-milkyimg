class replacefile
	constructor: (@$replaceimg) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$replaceimg.find '#insertimg'

	getContext: (@$el)->
		@$selected = @$replaceimg.find '.selected_folder'
		isfoder = !isimg = @$selected.is('li')
		if isimg
			@$newsrc = @$selected.data 'path-file'
			@changeSrc(@$newsrc)

		if isfoder
			$targetblockimg = $('.target').parents('.blocks.img')
			@$newsrc = @$selected.find('li:first-child').data 'path-file'
			@changeSrc(@$newsrc)

			@$selected.find('> ul > li').not(':first-child').each (index) ->
				@$newsrc = $(this).data 'path-file'
				console.log(index+ '  ???' + @$newsrc)
				new module.addslides($targetblockimg, @$newsrc).addslide()

	changeSrc: (@$newsrc) ->
		$('.target').attr('src',@$newsrc)
		$('.target').removeClass 'target'
		$('.server').addClass 'hidden'
		$('body').removeClass 'popin'
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click replaceimg'
			@getContext($(event.currentTarget))

module.replacefile = replacefile

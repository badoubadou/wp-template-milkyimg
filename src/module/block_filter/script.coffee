class filter
	constructor: (@$container, @$debounce) ->
		@select = @$container.find('select')
		@window = $(window);
		@height = @$container.offset().top
		@checkbox = @$container.find('#showfilterlabel')
		@toogleFixedClass()
		@bindEvents()

	toogleFixedClass: ->
		console.log 'toogleFixedClass : '+(( @window.scrollTop() >= @height))
		console.log ' ==== @window.scrollTop('+@window.scrollTop()+')  >= '+@height+' @height'

		if(( @window.scrollTop() >= @height))
			@$container.addClass 'fixed-filter'
			$('#main').css('padding-top',  @$container.outerHeight() )
		else
			@$container.removeClass 'fixed-filter'
			$('#main').css('padding-top', '')

	bindEvents: ->
		@window.scroll (w) =>
			@$debounce(@toogleFixedClass())

		@select.change (e) =>
			console.log 'changed'
			$string = '?'
			@select.each (index) ->
				if( $(this).find('option:selected').val() != 'label' )
					$string += $(this).attr 'id'
					$string += '=' + $(this).find('option:selected').val()
					$string += '&'
					console.log index
					console.log $string
				return

			if $('body').hasClass 'lang-nl'
				$string += 'lang=nl'
			$('#main').load $string + ' #main'

module.filter = filter

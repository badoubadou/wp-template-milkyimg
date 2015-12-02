class addslides
	constructor: (@$container, @insertWithSrc) ->
		@getContext()
		console.log @insertWithSrc+'  @insertWithSrc'
		if !@insertWithSrc
			@bindEvents()

	getContext: (@$el)->
		@$btn = @$container.find '.addslide'
		@$content = @$container.find '.content'
		@$slides = @$content.find '.slides'

	returnid: ->
		d = new Date
		@$id = d.getTime()
		return @$id

	addslide: ->
		console.log('addslide = @imgsrc : ' + @insertWithSrc)
		@$newslide = $('#samples #slide').clone()
		if @insertWithSrc
			@$newslide.find('img').attr('src',@insertWithSrc)
		@$id = 'slide'+@returnid()
		@$newslide.attr('id',@$id)
		@$slides.append(@$newslide)
		txt = new module.txteditor('#'+@$id+' .flex-caption')
		showserver = new module.showcloud($('#'+@$id+' img'))
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@addslide()

module.addslides = addslides

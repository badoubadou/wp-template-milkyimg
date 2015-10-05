class addslides
	constructor: (@$container) ->
		@getContext()
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
		# $('#main').sortable 'destroy'
		@$newslide = $('#samples #slide').clone()
		@$id = 'slide'+@returnid()
		@$newslide.attr('id',@$id)
		@$slides.append(@$newslide)
		txt = new module.txteditor('#'+@$id+' .flex-caption')
		showserver = new module.showcloud($('#'+@$id+' img'))
		console.log @$slides.html()
		# $('#main').sortable handle: '.handle'
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@addslide()

module.addslides = addslides

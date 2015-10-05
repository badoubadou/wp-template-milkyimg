class addblocks
	constructor: (@$container, @$samples) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$container.find '.btnadd'

	returnid: ->
		d = new Date
		@$id = d.getTime()
		return @$id

	getContext: (@$el)->
		@$thisblock = @$el
		@$parent = @$el.parent()
		@$grandparent = @$parent.parent()
		@$inserttop = @$parent.data 'insert-top'
		@$type = @$parent.find('.type option:selected').val()
		@$newblock = @$samples.find '.blocks.'+@$type
		# @$classname = @$parent.find '.classname'

	insertBlock: ->
		$('#main').sortable 'destroy'
		d = new Date
		@$id = 'module'+@returnid()
		@$cloned = @$newblock.clone().attr('id', @$id).attr('data-type', @$type).attr('class','blocks '+@$type)
		if @$inserttop
			@$cloned.insertBefore @$grandparent
		else
			@$cloned.insertAfter @$grandparent

		if(@$type=='txt')
			txtedit = new module.txteditor('#'+@$id+' .content')

		if(@$type=='img')
			addslide = new module.addslides($('#'+@$id))

		$('#main').sortable handle: '.handle'
		$('body').addClass 'savable'


	bindEvents: ->
		@$btn.on 'click', (event) =>
			@getContext($(event.currentTarget))
			@insertBlock()

module.addblocks = addblocks

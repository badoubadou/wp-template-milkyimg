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
		@$parent = @$el.parent().parent()
		@$grandparent = @$parent.parent()
		@$inserttop = @$parent.data 'insert-top'
		@$type = @$parent.find('input[type="radio"]:checked').val()
		@$newblock = @$samples.find '.blocks.'+@$type

	insertBlock: ->
		$('#main').sortable 'destroy'
		d = new Date
		@$id = 'module'+@returnid()
		@$cloned = @$newblock.clone().attr('id', @$id).attr('data-type', @$type).attr('class','blocks '+@$type)
		if @$inserttop
			@$cloned.insertAfter @$parent
		else
			@$cloned.insertAfter @$grandparent

		if(@$type=='txt')
			txtedit = new module.txteditor('#'+@$id+' .editable')

		if(@$type=='img')
			addslide = new module.addslides($('#'+@$id))
			txt = new module.txteditor('#'+@$id+' .flex-caption')
			showserver = new module.showcloud($('#'+@$id+' img'))

		addblocks = new module.addblocks(@$cloned.find('.addblocks'), $('#samples'))
		removeblocks = new module.removeblocks(@$cloned.find('.bin'))

		$('#main').sortable handle: '.handle'
		$('body').addClass 'savable'


	bindEvents: ->
		@$btn.on 'click', (event) =>
			@getContext($(event.currentTarget))
			@insertBlock()

module.addblocks = addblocks

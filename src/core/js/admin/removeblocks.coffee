class removeblocks
	constructor: (@$btn) ->
		@bindEvents()

	getContext: (@$el)->
		@$thisblockid = @$el.data 'id-to-remove'
		@$data_level = @$el.data 'level'
		@$need_update_col_size = @$el.data 'need-update-col-size'
		@$grid = $('#'+@$thisblockid).parent()

	removeBlock: ->
		# $('#main').sortable 'destroy'
		new module.sorting().suspend()
		$('#'+@$thisblockid).remove()
		if(@$need_update_col_size)
			new module.updatecolsize(@$grid, @$data_level)
		# $('#main').sortable handle: '.handle'
		new module.sorting().reactive()
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@getContext($(event.currentTarget))
			@removeBlock()

module.removeblocks = removeblocks

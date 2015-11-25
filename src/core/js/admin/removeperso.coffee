class removeperso
	constructor: (@$btn) ->
		@bindEvents()

	getContext: (@$el)->
		@$thisblock = @$el.parent()

	removeBlock: ->
		$('.persons').sortable 'destroy'
		@$thisblock.remove()
		if(@$need_update_col_size)
			new module.updatecolsize(@$grid, @$data_level)
		$('.persons').sortable handle: '.moveperso'
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@getContext($(event.currentTarget))
			@removeBlock()

module.removeperso = removeperso

class removeperso
	constructor: (@$btn) ->
		@bindEvents()

	getContext: (@$el)->
		@$thisblock = @$el.parent()

	removeBlock: ->
		new module.sorting().suspend()
		@$thisblock.remove()
		$('body').addClass 'savable'
		new module.sorting().reactive()

	bindEvents: ->
		@$btn.on 'click', (event) =>
			@getContext($(event.currentTarget))
			@removeBlock()

module.removeperso = removeperso

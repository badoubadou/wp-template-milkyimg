class removeblocks
	constructor: (@$btn) ->
		@bindEvents()

	getContext: (@$el)->
		@$thisblock = @$el.parent().parent()

	removeBlock: ->
		$('#main').sortable 'destroy'
		console.log @$thisblock.html()
		@$thisblock.remove()
		$('#main').sortable handle: '.handle'
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@getContext($(event.currentTarget))
			@removeBlock()

module.removeblocks = removeblocks

class searchfocus
	constructor: (@$btn, @$field) ->
		@bindEvents()

	bindEvents: ->
		$field = @$field
		@$field.focus()
		@$btn.change ->
			$field.focus()
			return

module.searchfocus = searchfocus

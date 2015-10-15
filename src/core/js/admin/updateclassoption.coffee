class updateclassoption
	constructor: (@$container) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$list_class = 'white black red fullscreen'
		@$block_id = @$container.attr 'data-module-id'
		@$btncolor = @$container.find '.listoptions .color'
		@$btnfullscreen = @$container.find '.listoptions .fullscreeninput input[type=checkbox]'
		@$isfullscreen = @$btnfullscreen.prop('checked')

	updateOption: ($newclasses)->
		@$new_list_class = $newclasses
		if(@$isfullscreen)
			@$new_list_class += ' fullscreen'
		$('#'+@$block_id).removeClass(@$list_class).addClass(@$new_list_class)
		$('#'+@$block_id).data('more-class',@$new_list_class).attr('data-more-class',@$new_list_class)

		$('#'+@$block_id).find('.grid .col-12 ').removeClass(@$list_class).addClass(@$new_list_class)
		$('#'+@$block_id).find('.grid .col-12 ').data('more-class',@$new_list_class).attr('data-more-class',@$new_list_class)


	bindEvents: ->
		@$btncolor.find('input[type=radio]').on 'change', (event) =>
			$newclass = @$btncolor.find('input[type=radio]:checked').val()
			@updateOption($newclass)
		@$btnfullscreen.on 'change', (event) =>
			@$isfullscreen = @$btnfullscreen.prop('checked')
			$newclass = @$btncolor.find('input[type=radio]:checked').val()
			@updateOption($newclass)
module.updateclassoption = updateclassoption
class updateclassoption
	constructor: (@$container) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$list_class = 'white black red fullscreen'
		@$block_id = @$container.attr 'data-module-id'
		@$listoptions = @$container.find '.listoptions'
		@$btncolor = @$listoptions.find '.color'
		@$actual_color = @$listoptions.data 'actual-color'
		@$btnfullscreen = @$listoptions.find ' .fullscreeninput input[type=checkbox]'
		@$isfullscreen = @$btnfullscreen.prop 'checked'

	updateOption: ($newcolor)->
		@$new_list_class = $newcolor
		@$actual_color = $newcolor
		if(@$isfullscreen)
			@$new_list_class += ' fullscreen'
		$('#'+@$block_id).removeClass(@$list_class).addClass(@$new_list_class)
		$('#'+@$block_id).data('more-class',@$new_list_class).attr('data-more-class',@$new_list_class)

		$('#'+@$block_id).find('.grid .col-12 ').removeClass(@$list_class).addClass(@$new_list_class)
		$('#'+@$block_id).find('.grid .col-12 ').data('more-class',@$new_list_class).attr('data-more-class',@$new_list_class)


	bindEvents: ->
		@$btncolor.find('input[type=radio]').on 'click', (event) =>
			$newcolor = @$btncolor.find('input[type=radio]:checked').val()
			console.log '@$actual_color  : '+@$actual_color + ' $newcolor : '+$newcolor
			if(@$actual_color == $newcolor)
				@$btncolor.find('input[type=radio]:checked').prop('checked', false)
				$newcolor = ''
			@updateOption($newcolor)
		@$btnfullscreen.on 'change', (event) =>
			@$isfullscreen = @$btnfullscreen.prop('checked')
			$newcolor = @$btncolor.find('input[type=radio]:checked').val()
			@updateOption($newcolor)
module.updateclassoption = updateclassoption
class sorting
	constructor: (@$btn) ->
		@$sort = null
		if(@$btn)
			@bindEvents()

	suspend: ->
		if($('.active_sortable').lenght)
			$('.active_sortable').sortable('destroy')

	reactive: ->
		if($('.active_sortable').lenght)
			$('.active_sortable').sortable(handle: '.handlesort').bind 'sortupdate', ->
				$('body').addClass('savable')
				return

	bindEvents: ->
		@$btn.on 'click', ->
			if(@$sort==$(this).parent().parent())
				return
			if(@$sort)
				@$sort.sortable('destroy')
			@$sort = $(this).parent().parent()
			$('.active_sortable').removeClass('active_sortable')
			@$sort.addClass('active_sortable')
			@$sort.sortable(handle: '.handlesort').bind 'sortupdate', ->
				$('body').addClass('savable')
				return
			return

module.sorting = sorting

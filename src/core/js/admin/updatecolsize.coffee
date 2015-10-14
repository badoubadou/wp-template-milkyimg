class updatecolsize
	constructor:(@$container, @$level) ->
		@update(@$container, @$level)

	update:(@$container, @$level) ->
		nbel = @$container.find('.blocks.level-'+@$level).length
		newnum = Math.round((12/nbel)*10)/10
		newclasscol = ('col-'+(newnum)).replace('.','-')
		@$container.find('.level-'+@$level).each (index) ->
			$(this).removeClass('col-12 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass(newclasscol)
			return

module.updatecolsize = updatecolsize

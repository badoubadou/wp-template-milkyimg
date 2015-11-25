class updatecolsize
	constructor:(@$container, @$level) ->
		@update(@$container, @$level)

	update:(@$container, @$level) ->
		nbel = @$container.find('.blocks.level-'+@$level).length
		if(nbel==2 && @$container.find('.blocks.level-'+@$level).first().hasClass('perso') && @$container.find('.blocks.level-'+@$level).last().hasClass('txt'))
			@$container.find('.perso').removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass('col-10').data('column','col-10')
			@$container.find('.txt').removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass('col-2').data('column','col-2')
		else
			newnum = Math.round((12/nbel)*10)/10
			newclasscol = ('col-'+(newnum)).replace('.','-')
			@$container.find('.level-'+@$level).each (index) ->
				$(this).removeClass('col-12 col-10 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass(newclasscol).data('column',newclasscol)
				return

module.updatecolsize = updatecolsize

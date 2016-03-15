debounce = (func, threshold, execAsap) ->
	timeout = false

	return debounced = ->
		obj = this
		args = arguments

		delayed = ->
			func.apply(obj, args) unless execAsap
			timeout = null

		if timeout
			clearTimeout(timeout)
		else if (execAsap)
			func.apply(obj, args)

		timeout = setTimeout delayed, threshold || 100

init = ->
	console.log 'doc ready'
	if($('.blocks.filter').length)
		bierfilter = new module.filter($('.blocks.filter'), debounce)
	popinnewsletter = new module.popin($('.top_menu li:last-child a'))
	searchfocus = new module.searchfocus($('#showsearch'),$('#s'))

$(window).load( init )

navigation = new module.navigation($('.navigation'))
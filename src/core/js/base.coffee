init = ->
	console.log 'doc ready'
	bierfilter = new module.filter($('.blocks.filter'))
	popinnewsletter = new module.popin($('.top_menu li:last-child a'))


$(window).load( init )

navigation = new module.navigation($('.navigation'))
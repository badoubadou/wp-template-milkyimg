init = ->
	console.log 'doc ready'
	$('.blocks.img:not(.fullscreen) .flexslider').flexslider({smoothHeight:true})
	$('.blocks.img.fullscreen .flexslider').each ->
		sliderfullscreen = new module.sliderfullscreen($(this))
		return


$(window).load( init )

navigation = new module.navigation($('.navigation'))
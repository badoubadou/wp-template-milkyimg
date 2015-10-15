init = ->
	console.log 'doc ready'+$('.blocks.img:not(.fullscreen)').length
	$('.blocks.img:not(.fullscreen) .flexslider').flexslider({smoothHeight:true})
	$('.blocks.img.fullscreen').each ->
		console.log 'call slider full screen'
		sliderfullscreen = new module.sliderfullscreen($(this))
		return


$(window).load( init )

navigation = new module.navigation($('.navigation'))
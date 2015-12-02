init = ->
	console.log 'doc ready'+$('.blocks.img:not(.fullscreen)').length

	$('.blocks.img:not(.fullscreen)').each ->
		console.log 'call slider screen'
		slidernormal = new module.slidernormal($(this))
		console.log slidernormal
		return
	# $('.blocks.img:not(.fullscreen) .flexslider').flexslider({smoothHeight:true,animation: 'slide'})
	$('.blocks.img.fullscreen').each ->
		console.log 'call slider full screen'
		sliderfullscreen = new module.sliderfullscreen($(this))
		console.log sliderfullscreen
		return


$(window).load( init )

navigation = new module.navigation($('.navigation'))
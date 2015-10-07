init = ->
	console.log 'doc ready'
	$('.blocks.img:not(.fullscreen)').flexslider({smoothHeight:true})
	$('.blocks.img.fullscreen').each ->
		sliderfullscreen = new module.sliderfullscreen($(this))
		return


$(window).load( init )
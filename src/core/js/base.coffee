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
	$('body').addClass 'doc-ready'

	if($('.addtocart').length)
		produit = new module.produit($('.addtocart'))


	speedslide = 1500
			
	if($('.flexslider').length)
		$('.flexslider').flexslider
			animation: 'slide'
			animationSpeed: speedslide
			pauseOnHover: false
			direction: 'vertical'
			start: (slider) ->
				$('body').addClass 'slider-ready '
				return
			after: (slider) ->
				check_mousewheel()
				return


	slider = $('.flexslider').data('flexslider')

	check_mousewheel = ->
		$('.flexslider.slider-full-height').on 'mousewheel', (event) ->
			console.log event.deltaX, event.deltaY, event.deltaFactor
			$('.flexslider.slider-full-height').unmousewheel()
			if(event.deltaY<0)
				slider.flexslider('next')
			if(event.deltaY>0)
				slider.flexslider('prev')
			return
		return

	check_mousewheel()

	if($('.cartpage').length)
		cart = new module.cart($('.cartpage'))

	if($('.btnpopin').length)
		console.log 'ya popin'
		popin = new module.popin($('.btnpopin'))

	if($('#contact-form').length)
		newsletter = new module.newsletter($('#contact-form'))

	if($('.sticky').length)
		sticky = new (Waypoint.Sticky)(element: $('.sticky')[0])
		inview = new (Waypoint.Inview)(
			element: $('#stop_stiky')[0]
			enter: (direction) ->
				$('.sticky').addClass 'fixed-at-bottom'
				console.log  'Enter triggered with direction ' + direction
				return
			exited: (direction) ->
				if(direction=='up')
					$('.sticky').removeClass 'fixed-at-bottom'
					console.log 'remove : ' +direction
				return
		)


$(window).load( init )

navigation = new module.navigation($('.navigation'))
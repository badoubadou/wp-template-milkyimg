class popin
	constructor: (@$btn) ->
		@checkbox = $('#showfilterlabel')
		@bindEvents()

	bindEvents: ->
		# activate nav items and their parents when clicked
		$('.mypopin .shield').on 'click', (e) =>
			$('body').removeClass 'popin_opended'

		@$btn.on 'click', (e) =>
			$url = $(e.target).attr 'href'
			console.log $url
			# $('.mypopin .content').load ($url + ' #main'), (response, status, xhr) ->
			# 	if status == 'error'
			# 		console.log 'Sorry but there was an error: '
			# 	else if status == 'success'
			# 		$('body').addClass 'popin_opended'
			# 		_bindform()
			# 	return
			# $.ajax
			# 	url: $url
			# 	type: 'post'
			# 	success: (resp) ->
			# 		$('.mypopin .content').html $('#main', resp).html()
			# 		$('.mypopin .content').html $('script', resp).html()
			# 		return
			$.ajax
				url: $url
				success: (response) ->
					console.log 'damened N?? = '+$(response).html()
					console.log $('#main', response).html()
					console.log $(response).filter('#main').html()
					$('body').addClass 'popin_opended'
					# $('.mypopin .content').html result.find '#main'
					$('.mypopin .content').html $(response).filter('#main')
					$('.mypopin .content').append $(response).filter('script')
					return


			console.log 'click : '+$url
			return false

module.popin = popin

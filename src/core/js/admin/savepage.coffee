class savepage
	constructor: (@$container, @$btn) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn
		@$captionedit = @$captionedit
		@$pagejson = {}
		@$blocks = @$container.find '.blocks'
		@$fileurl =  $('body').data 'pagejson'
		console.log  @$fileurl

	updatelist: ->
		@$blocks = @$container.find '.blocks'

	croalContent: ($container) ->
		$tab = {}
		$container.each (index, element) =>
			$el_content = $(element).find '.content'
			$el_warper = $(element).find '.warper:first-child'
			$el_class = $(element).data 'more-class'
			$el_type = $(element).data 'type-module'
			$el_level = $(element).data 'type-level'
			$el_id = $(element).attr 'id'
			$full_screen = $(element).find('.fullbox').is(':checked')
			$empty = false


			if($full_screen)
				$el_class += ' fullscreen'

			if($el_type=='txt')
				$content_to_save = $el_content.find('.editable').html()
				$empty = ($el_content.find('.editable').text()=='') ? true : false

			if($el_type=='img')
				$sliderjson = {}
				$el_content.find('.slides li').each (index, slide) ->
					$emptyslide = false
					$imgslide = $(slide).find 'img'
					$emptyslide = ($imgslide.attr('src')=='http://placehold.it/350x150') ? true : false
					console.log '$emptyslide : '+$emptyslide
					$caption = $(slide).find '.flex-caption'
					if(!$emptyslide)
						$sliderjson[index] =
						{
							'img' : $imgslide.attr('src'),
							'caption' : $caption.html()
						}
					return
				console.log '$sliderjson : '+$sliderjson
				$content_to_save = $sliderjson

			if($el_type=='repeater')
				$content_to_save = @croalContent($el_warper.find('.level-1'))
				console.log JSON.stringify($content_to_save)

			if(!$empty)
				$tab[$el_id] =
				{
					'type': $el_type,
					'classes': $el_class,
					'content': $content_to_save
				}
			console.log $content_to_save+'  content_to_save '

		return $tab

	makeJson: ->
		console.log 'makeJson'
		@$pagejson = @croalContent(@$container.find('.level-0'))
		@sendJson()

	sendJson: ->
		console.log 'sendJson'
		$.ajax(
			type:'POST',
			url: 'php/changedata.php',
			data: {'fileurl': @$fileurl, 'content': JSON.stringify(@$pagejson)}
			).done ->
			location.reload(true)

	bindEvents: ->
		@$btn.on 'click', (e) =>
			@makeJson()

module.savepage = savepage

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

	cleanContent: ->
		@$caption = @$container.find '.needcleaning'
		@$caption.removeAttr('id').removeAttr('contenteditable').removeAttr('spellcheck').removeAttr('style').removeClass('mce-content-body')

	makeJson: ->
		console.log 'makeJson'
		@cleanContent()
		@$container.find('.blocks').each (index, element) =>
			$el_content = $(element).find '.content'
			$el_class = $(element).attr('class').replace(/blocks blocks/g,'blocks').replace(/fullscreen/g,'')
			$full_screen = $(element).find('.fullbox').is(':checked')
			if($full_screen)
				$el_class += ' fullscreen'
			$html_content = $el_content.find('.editable').html()
			$el_id = $(element).attr 'id'
			console.log $el_content.find('.slides').length
			console.log $el_content.html()
			if($el_content.find('.slides').length)
				$sliderjson = {}
				$el_content.find('.slides li').each (index, slide) ->
					$imgslide = $(slide).find 'img'
					$caption = $(slide).find '.flex-caption'
					$sliderjson[index] = {'img' : $imgslide.attr('src'), 'caption' : $caption.html()}
					return
				$html_content = $sliderjson
			@$pagejson[$el_id] = {'classes': $el_class, 'content': $html_content}
		@sendJson()

	sendJson: ->
		console.log 'sendJson'
		$.ajax(
			type:'POST',
			url: 'php/changedata.php',
			data: {'fileurl': @$fileurl, 'content': JSON.stringify(@$pagejson)}
			).done ->
			location.reload(true)
			# $('body').removeClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (e) =>
			@makeJson()

module.savepage = savepage

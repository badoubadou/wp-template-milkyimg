class savepage
	constructor: (@$container, @$btn) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn
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
			$el_class = $(element).attr('class').replace(/blocks blocks/g,'blocks')
			$full_screen = $(element).find('.fullbox').is(':checked')
			console.log $(element).find('.fullbox').is(':checked')+'############################################ '
			if($full_screen)
				$el_class += ' fullscreen'
			$html_content = $el_content.html()
			$el_id = $(element).attr('id')
			@$pagejson[$el_id] = {'classes': $el_class, 'content': $html_content}
			console.log $html_content
		@sendJson()

	sendJson: ->
		console.log 'sendJson'
		$.ajax(
			type:'POST',
			url: 'php/changedata.php',
			data: {'fileurl': @$fileurl, 'content': JSON.stringify(@$pagejson)}
			).done ->
			$('body').removeClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click' + @$pagejson
			@makeJson()


module.savepage = savepage

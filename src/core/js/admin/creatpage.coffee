class savenav
	constructor: (@$btn, @$txtedit) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$btn
		@$navjson = {}
		@$fileurl =  $('body').data 'navjson'

	croalContent: ($container, $where) ->
		$tab = {}
		$container.find('.nav-group li').each (index, element) =>
			$te = @$txtedit
			$el_content = $(element).find '.content:first-child'

			$content_to_save = $te.getCont($el_content.find('.editable').attr('id'))

			$tab[$el_id] =
			{
				'position':$where,
				'link':'wie-wer-was',
				'linkopposite':'qui-que-quoi',
				'title':'Wie wer was',
				'datajson':'p2',
				'speciallayout':'',
				'illustration':''
			}
			console.log $content_to_save+'  content_to_save '
		return $tab

	makeJson: ->
		@$navjson = @croalContent($('.blocks.navigation'), 'header')
		console.log JSON.stringify(@$navjson)
		# @sendJson()

	sendJson: ->
		console.log 'sendJson'
		$('body').removeClass('savable')
		$.ajax(
			type:'POST',
			url: 'php/changedata.php',
			data: {
				'fileurl': @$fileurl,
				'content': JSON.stringify(@$navjson)
				}).done ->
			location.reload(true)

	bindEvents: ->
		@$btn.on 'click', (e) =>
			@makeJson()

module.savenav = savenav

class savepage
	constructor: (@$container, @$btn, @$txtedit) ->
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

	getContentlist: ($container, $txt, $defaultpics, $autre) ->
		$tab = {}
		$te = @$txtedit
		$container.find('li').each (index, slide) ->
			$imgslide = $(slide).find 'img'
			$imgsrc = ($imgslide.attr('src')!=$defaultpics) ? false : $imgslide.attr('src')
			if($imgsrc)
				$tab[index] = {}
				$tab[index]['img'] = $imgslide.attr('src')
				tot = $txt.length
				i = 0
				while i < tot
					txtname = $txt[i]
					console.log ' $txt[i] : '+ $txt[i]
					classname = '.'+txtname
					console.log 'classname : '+classname
					newtxt = $(slide).find classname
					txt_content =  $te.getCont(newtxt.attr('id'))
					$tab[index][txtname] = txt_content
					i++

		return $tab


	croalContent: ($container, $level) ->
		$tab = {}
		# $te = @$txtedit
		console.log '$txtedit  lenght'+$container.find('.level-'+$level).length
		$container.find('.blocks.level-'+$level).each (index, element) =>
			$te = @$txtedit

			$el_content = $(element).find '.content:first-child'
			$el_class = $(element).attr('data-more-class').split(' ')
			$el_type = $(element).data 'type-module'
			$el_col = $(element).data 'column'
			$el_level = $(element).data 'type-level'
			$el_id = $(element).attr 'id'
			$empty = false
			$intro = ''
			console.log '$el_class : '+$el_class+ '//// '+$(element).attr('data-more-class')

			if($el_type=='txt')
				$content_to_save = $te.getCont($el_content.find('.editable').attr('id'))
				$empty = ($el_content.find('.editable').text()=='') ? true : false

			if($el_type=='img')
				$content_to_save = @getContentlist($el_content, ['flex-caption'], 'http://placehold.it/350x150')
				$intro = $te.getCont($el_content.find('.intro').attr('id'))

			if($el_type=='perso')
				$content_to_save = @getContentlist($el_content, ['name', 'infos'], 'http://placehold.it/150x150')


			if($el_type=='repeater')
				$content_to_save = @croalContent($el_content,($level+1))
				console.log JSON.stringify($content_to_save)

			if(!$empty)
				$tab[$el_id] =
				{
					'type': $el_type,
					'classes': $el_class,
					'level': $level,
					'column': $el_col,
					'intro': $intro,
					'content': $content_to_save
				}
			console.log $content_to_save+'  content_to_save '

		return $tab

	makeJson: ->
		@$pagejson = @croalContent(@$container, 0)
		console.log JSON.stringify(@$pagejson)
		@sendJson()

	sendJson: ->
		console.log 'sendJson'
		$('body').removeClass('savable')
		$.ajax(
			type:'POST',
			url: 'php/changedata.php',
			data: {
				'fileurl': @$fileurl,
				'content': JSON.stringify(@$pagejson)
				}).done ->
			location.reload(true)

	bindEvents: ->
		@$btn.on 'click', (e) =>
			@makeJson()

module.savepage = savepage

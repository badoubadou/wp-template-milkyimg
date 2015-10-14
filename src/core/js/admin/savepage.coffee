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

	croalContent: ($container, $level) ->
		$tab = {}
		console.log '$level : '+$level+'  lenght'+$container.find('.level-'+$level).length
		$container.find('.blocks.level-'+$level).each (index, element) =>
			$el_content = $(element).find '.content:first-child'
			$el_class = $(element).attr('data-more-class').split(' ')
			$el_type = $(element).data 'type-module'
			$el_level = $(element).data 'type-level'
			$el_id = $(element).attr 'id'
			$empty = false
			console.log '$el_class : '+$el_class+ '//// '+$(element).attr('data-more-class')


			if($el_type=='txt')
				$content_to_save = $el_content.find('.editable').html()
				$empty = ($el_content.find('.editable').text()=='') ? true : false

			if($el_type=='img')
				$sliderjson = {}
				$el_content.find('.slides li').each (index, slide) ->
					$emptyslide = false
					$imgslide = $(slide).find 'img'
					$emptyslide = ($imgslide.attr('src')=='http://placehold.it/350x150') ? true : false
					$caption = $(slide).find '.flex-caption'
					$emptycap = ($caption.text()=='' || $caption.text()==' ' || $caption.text()=='  ' || $caption.html()=='&nbsp;' || $caption.html()=='<p>&nbsp;<br></p>' || $caption.html()=='<p>&nbsp;</p>'|| $caption.html()=='<p></p>'|| $caption.html()=='<p><br></p>')
					$caption_content = $caption.html()
					if($emptycap)
						$caption_content = ''
					if(!$emptyslide)
						$sliderjson[index] =
						{
							'img' : $imgslide.attr('src'),
							'caption' : $caption_content
						}
					return
				$content_to_save = $sliderjson

			if($el_type=='repeater')
				$content_to_save = @croalContent($el_content,($level+1))
				console.log JSON.stringify($content_to_save)

			if(!$empty)
				$tab[$el_id] =
				{
					'type': $el_type,
					'classes': $el_class,
					'level': $level
					'content': $content_to_save
				}
			console.log $content_to_save+'  content_to_save '

		return $tab

	makeJson: ->
		@$pagejson = @croalContent(@$container, 0)
		@sendJson()

	sendJson: ->
		console.log 'sendJson'
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

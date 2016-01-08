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
		@$navurl =  $('body').data 'navjson'
		@$nav = $('.blocks.navigation .nav-group')
		@$isnewpage = $('body').hasClass 'newpage'
		@$newurl = 'newpage'
		@$newtitle = 'newpage'
		@$nbfilechanged = 0
		@$nbFileToChange = 2
		console.log '@$nbFileToChange = ' + @$nbFileToChange

	updatelist: ->
		@$blocks = @$container.find '.blocks'

	getContentlist: ($container, $txt, $defaultpics, $autre) ->
		$tab = {}
		$te = @$txtedit
		$container.find('li').each (index, slide) ->
			$imgslide = $(slide).find 'img'
			$hdsrc = $imgslide.attr('src').replace('low-res-','')
			$imgsrc = ($hdsrc!=$defaultpics) ? false : $hdsrc
			if($imgsrc)
				$tab[index] = {}
				$tab[index]['img'] = $hdsrc
				tot = $txt.length
				i = 0
				while i < tot
					txtname = $txt[i]
					# console.log ' $txt[i] : '+ $txt[i]
					classname = '.'+txtname
					# console.log 'classname : '+classname
					newtxt = $(slide).find classname
					txt_content =  $te.getCont(newtxt.attr('id'))
					$tab[index][txtname] = txt_content
					i++

		return $tab

	croalContent: ($container, $level) ->
		$tab = {}
		# $te = @$txtedit
		# console.log '$txtedit  lenght : '+$container.find('.level-'+$level).length
		$container.find('.blocks.level-'+$level).each (index, element) =>
			# console.log '?????'
			$te = @$txtedit

			$el_content = $(element).find '.content:first-child'
			$el_class = $(element).attr('data-more-class').split(' ')
			$el_type = $(element).data 'type-module'
			$el_col = $(element).data 'column'
			$el_level = $(element).data 'type-level'
			$el_id = $(element).attr 'id'
			$empty = false
			$intro = ''
			$sourcemedia = ''
			# console.log '$el_class : '+$el_class+ '//// '+$(element).attr('data-more-class')

			if($el_type=='txt')
				$content_to_save = $te.getCont($el_content.find('.editable').attr('id'))
				$empty = ($el_content.find('.editable').text()=='') ? true : false

			if($el_type=='img')
				$content_to_save = @getContentlist($el_content, ['flex-caption'], 'http://placehold.it/350x150')
				$intro = $te.getCont($el_content.find('.intro').attr('id'))
				$empty = $el_content.find('li').length ? true : false
				# console.log $empty+' ??? empty'

			if($el_type=='music')
				$content_to_save = $te.getCont($el_content.find('.intro').attr('id'))
				$sourcemedia = $el_content.find('.audioplayer').attr('src')

			if($el_type=='perso')
				$content_to_save = @getContentlist($el_content, ['name', 'infos'], 'http://placehold.it/150x150')

			if($el_type=='repeater')
				$content_to_save = @croalContent($el_content,($level+1))
				# console.log JSON.stringify($content_to_save)

			if(!$empty)
				$tab[$el_id] =
				{
					'type': $el_type,
					'classes': $el_class,
					'level': $level,
					'column': $el_col,
					'intro': $intro,
					'content': $content_to_save,
					'sourcemedia' : $sourcemedia
				}
			# console.log $content_to_save+'  content_to_save '
		return $tab

	getinfofromnewtitle: ->
		@$newtitle = $('#newpagename').val()
		$makecleanurl = new module.cleanurl(@$newtitle)
		@$newurl = $makecleanurl.cleanstring(@$newtitle)
		$tab = {
			"position":"header",
			"link":@$newurl,
			"title":@$newtitle,
			"datajson":@$newurl,
			"linkopposite":@$newurl
		}
		return $tab


	croalnav: ($container) ->
		$tab = {}
		$idtab = 0
		$container.find('li').each (index, element) =>

			if($(element).hasClass('selected'))
				$tabnew = @getinfofromnewtitle()
				$el_link = $tabnew['link']
				$el_title = $tabnew['title']
				$el_datajson = $(element).find('a').data 'datajson'
				$el_img = $('.newpageimage').attr 'src'
			else
				$el_link_el = $(element).find('a')
				$el_link = $el_link_el.data 'link'
				$el_title = $el_link_el.text()
				$el_img = $(element).find('img').attr 'src'
				$el_datajson = $el_link_el.data 'datajson'

			$idtab = index

			$tab[$idtab] =
			{
				"position":"header",
				"link":$el_link,
				"title":$el_title,
				"datajson":$el_datajson,
				"img":$el_img,
				"linkopposite":$el_link,
			}

		if @$isnewpage
			$idtab += 1
			$tab[$idtab] =
			{
				"position":"header",
				"link":@$newurl,
				"title":@$newtitle,
				"datajson":@$newurl,
				"linkopposite":@$newurl,
			}
		console.log $tab
		return $tab

	makeJson: ->
		if @$isnewpage
			@$newtitle = $('#newpagename').val()
			if(!@$newtitle)
				return false
			$makecleanurl = new module.cleanurl(@$newtitle)
			@$newurl = $makecleanurl.cleanstring(@$newtitle)
			@$fileurl =  @$newurl+ $('body').data 'lang'
			$('body').data( 'pagejson', @$newurl)

		@$pagejson = @croalContent(@$container, 0)
		@$navjson = @croalnav(@$nav, 0)
		# console.log JSON.stringify(@$pagejson)
		@sendJson()
		@sendJsonNav()

	JsonChanged: ->
		@$nbfilechanged += 1
		console.log @$nbFileToChange+'@$$nbfilechanged '+ @$nbfilechanged
		if(@$nbFileToChange == @$nbfilechanged)
			location.reload(true)

	sendJson: ->
		# console.log 'sendJson'
		$('body').removeClass('savable')
		_that = @
		$.ajax(
			type:'POST',
			url: '/php/changedata.php',
			data: {
				'fileurl': @$fileurl,
				'content': JSON.stringify(@$pagejson)
				}).done ->
			_that.JsonChanged()

	sendJsonNav: ->
		# console.log 'sendJson'
		_that = @
		$('body').removeClass('savable')
		$.ajax(
			type:'POST',
			url: '/php/changedata.php',
			data: {
				'fileurl': @$navurl,
				'content': JSON.stringify(@$navjson)
				}).done ->
			_that.JsonChanged()

	bindEvents: ->
		@$btn.on 'click', (e) =>
			console.log 'click'
			@makeJson()

module.savepage = savepage

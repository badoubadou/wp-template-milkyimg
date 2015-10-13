class addblocks
	constructor: (@$container) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$container.find '.btnadd'

	returnid: ->
		d = new Date
		$newid = d.getTime()
		return $newid

	getContext: (@$el)->
		@$blockid = @$el.data 'insert-after'
		console.log '@$blockid = '+@$blockid
		@$level = @$el.data 'level'
		@$addblocksdiv = @$el.parent()
		@$need_repeater = @$el.data 'add-repeater'
		@$repeater_on_top = $('#'+@$blockid).parent()
		@$type = @$addblocksdiv.find('input[type="radio"]:checked').val()

	# updateColClass:($el) ->
	# 	nbel = $el.find('.blocks.level-'+@$level).length
	# 	console.log nbel+' nbel'
	# 	newnum = Math.round((12/nbel)*10)/10
	# 	newclasscol = ('col-'+(newnum)).replace('.','-')
	# 	$el.find('.level-'+@$level).each (index) ->
	# 		$(this).removeClass('col-12 col-8 col-6 col-4 col-3 col-2-4 col-2 col-1-7 col-1-5').addClass(newclasscol)
	# 		return

	updateIdChecker:($el, $levelblock) ->
		$el.find('.bin').data('data-lign-id',@$id).attr('data-lign-id', @$id)
		$el.find('.btnadd').data('level',$levelblock).attr('data-level',$levelblock).data('insert-after',@$id).attr('data-insert-after', @$id)
		labelname = 'type'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
		$el.find('.warpinput').each (index) ->
			labelid = 'type'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
			$(this).find('input').attr('name',labelname).attr('id',labelid)
			$(this).find('label').attr('for',labelid)
			return

	creatBlock: ->
		@$id = 'module'+@returnid()
		@$newblock = $('#samples').find '.blocks.'+@$type
		console.log '--- @$type =  '+@$type
		$levelblock = @$level
		if(@$need_repeater)
			$levelblock += 1

		$block = @$newblock.clone().attr('id', @$id).attr('data-type', @$type).attr('class','blocks '+@$type+' level-'+$levelblock)
		$block.find('.warper.level-').removeClass('level-').addClass('level-'+$levelblock)
		@updateIdChecker($block.find('.listbtnright'), $levelblock)
		console.log $block.html()+'  $block '
		$ret = $block

		if(@$need_repeater)
			$id = 'module'+@returnid()
			$new_repeater = $('#samples').find '.blocks.repeater'
			$repeater = $new_repeater.clone().attr('id', $id).attr('data-type', 'repeater').attr('class','blocks repeater level-'+@$level)
			$repeater.find('.warper.level-').removeClass('level-').addClass('level-'+@$level)
			$block.addClass('col-12')
			$repeater.find('.content').append($block)
			$ret = $repeater

		return $ret

	insertBlock: ->
		$('#main').sortable 'destroy'

		@$cloned = @creatBlock()

		@$cloned.insertAfter('#'+@$blockid)
		console.log @$cloned.html()+" ----- insertAfter('#"+@$blockid+")"

		if(!@$need_repeater)
			new module.updatecolsize(@$repeater_on_top, @$level)
			# @updateColClass(@$repeater_on_top)

		if(@$type=='txt')
			txtedit = new module.txteditor('#'+@$id+' .editable')

		if(@$type=='img')
			addslide = new module.addslides($('#'+@$id))
			txt = new module.txteditor('#'+@$id+' .flex-caption')
			showserver = new module.showcloud($('#'+@$id+' img'))

		addblocks = new module.addblocks(@$cloned.find('.addblocks'), $('#samples'))
		removeblocks = new module.removeblocks(@$cloned.find('.bin'))

		$('#main').sortable handle: '.handle'
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			@getContext($(event.currentTarget))
			@insertBlock()

module.addblocks = addblocks

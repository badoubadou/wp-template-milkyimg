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
		@$type = @$addblocksdiv.find('.warpinput.typemodule input[type="radio"]:checked').val()

	updateIdChecker:($el, $levelblock, $id) ->
		$el.find('.bin').data('id-to-remove',$id).attr('data-id-to-remove', $id)
		$el.find('.btnadd').data('level',$levelblock).attr('data-level',$levelblock).data('insert-after',$id).attr('data-insert-after', $id)
		labelnametype = 'type'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
		labelnamecolor = 'type'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
		$el.find('.warpinput.color').each (index) ->
			labelid = 'color'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
			$(this).find('input').attr('name',labelnamecolor).attr('id',labelid)
			$(this).find('label').attr('for',labelid)
			return
		$el.find('.warpinput.typemodule').each (index) ->
			labelid = 'type'+(((1+Math.random())*0x10000)|0).toString(16).substring(1)
			$(this).find('input').attr('name',labelnametype).attr('id',labelid)
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
		@updateIdChecker($block.find('.listbtnright'), $levelblock, @$id)
		$ret = $block

		if(@$need_repeater)
			$id = 'module'+@returnid()
			$new_repeater = $('#samples').find '.blocks.repeater'
			$repeater = $new_repeater.clone().attr('id', $id).attr('data-type', 'repeater').attr('class','blocks repeater level-'+@$level)
			$repeater.find('.warper.level-').removeClass('level-').addClass('level-'+@$level)
			$block.addClass('col-12')
			@updateIdChecker($repeater.find('.listbtnright'), @$level, $id)
			$repeater.find('.content').append($block)
			$ret = $repeater

		return $ret

	insertBlock: ->
		$('#main').sortable 'destroy'

		@$cloned = @creatBlock()

		@$cloned.insertAfter('#'+@$blockid)
		# console.log @$cloned.html()+" ----- insertAfter('#"+@$blockid+")"

		if(!@$need_repeater)
			new module.updatecolsize(@$repeater_on_top, @$level)

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

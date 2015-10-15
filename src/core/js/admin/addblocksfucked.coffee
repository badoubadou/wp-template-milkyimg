class addblocksfucked
	constructor: (@$container, @$samples) ->
		@setOptions()
		@bindEvents()

	setOptions: ->
		@$btn = @$container.find '.btnadd'

	returnid: ->
		d = new Date
		$newid = d.getTime()
		return $newid

	insertlign: ->
		if @$inserttop
			@$cloned.insertAfter @$parent
		else
			@$cloned.insertAfter @$grandparent

	creatReapeater: ->
		@$parent.removeClass('txt').addClass('repeater grid').attr('data-type-module', 'repeater')
		$contentdiv = @$parent.find('.content')
		$warpcontent = $contentdiv.parent()
		$warpcontent.addClass('repeater')
		$ligncont = $contentdiv.find('.editable').html()
		@$parent.find('.listbtnright .btnadd').remove()
		@$parent.find('.listbtnright .warpinput:not(.fullscreeninput)').remove()
		$firstcol = @$newblock.clone().attr('id', 'module'+@returnid()).attr('data-type', @$type).attr('class','blocks '+@$type+' level-1 col-6')
		$firstcol.find('.content .editable').html($ligncont)
		$warpcontent.empty().append($firstcol).append(@$cloned.removeClass('level-0').addClass('level-1').addClass('col-6'))
		$warpcontent.find('.addblocks:not(.listbtnright)').remove()
		$warpcontent.find('.listbtnright .fullscreeninput').remove()
		$warpcontent.find('.listbtnright').attr('data-lign-id', @$parent.attr('id'))
		$warpcontent.find('.listbtnright .btnadd').attr('data-level','1')


	insertColumn: ->
		if(!@$nbColumn)
			@creatReapeater()
		else
			oldnum = Math.round((12/@$nbColumn)*10)/10
			oldclasscol = ('col-'+(oldnum)).replace('.','-')
			newnbcol = parseFloat(@$nbColumn)+1
			newnum = Math.round((12/newnbcol)*10)/10
			newclasscol = ('col-'+(newnum)).replace('.','-')
			console.log 'newnbcol : '+newnbcol

			@$cloned.find('.addblocks:not(.listbtnright)').remove()
			@$cloned.find('.listbtnright .fullscreeninput').remove()
			@$cloned.addClass(newclasscol)
			$('#'+@$lignId).find('.'+oldclasscol).removeClass(oldclasscol).addClass(newclasscol)
			@$cloned.insertAfter @$parent
			$('#'+@$lignId).find('.listbtnright .btnadd').attr('data-level','1')
			$('#'+@$lignId).find('.listbtnright').attr('data-lign-id',@$lignId)


	getContext: (@$el)->
		@$thisblock = @$el
		@$level = @$el.data 'level'
		@$infoColum = @$el.parent()
		@$parent = @$el.parent().parent()
		@$grandparent = @$parent.parent()
		@$inserttop = @$parent.data 'insert-top'
		@$wantToInsertColumn = @$infoColum.data 'insert-column'
		@$lignId = @$infoColum.attr('data-lign-id')
		console.log @$lignId + "@$infoColum.attr('data-lign-id') : "+@$infoColum.attr('data-lign-id')+" @$infoColum.data('lign-id')"+@$infoColum.data('lign-id')
		@$nbColumn = $('#'+@$lignId).find('.level-1').length
		console.log "@$nbColumn  : "+@$nbColumn
		@$type = @$parent.find('input[type="radio"]:checked').val()
		@$newblock = @$samples.find '.blocks.'+@$type
		@$id = 'module'+@returnid()


	creatBlock: ($level)->
		$cloned = @$newblock.clone().attr('id', @$id).attr('data-type', @$type).attr('class','blocks '+@$type+' level-'+$level)
		return $cloned

	insertBlock: ->
		$('#main').sortable 'destroy'

		@$cloned = @creatBlock(@$level)


		if(@$wantToInsertColumn)
			@insertColumn()
		else
			@insertlign()

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

module.addblocksfucked = addblocksfucked

class addpersons
	constructor: (@$container) ->
		@getContext()
		@bindEvents()

	getContext: (@$el)->
		@$btn = @$container.find '.addperso'
		@$content = @$container.find '.content'
		@$persons = @$content.find '.persons'

	returnid: ->
		d = new Date
		@$id = d.getTime()
		return @$id

	addperson: ->
		@$newperson = $('#samples #person li').clone()
		@$id = 'person'+@returnid()
		@$newperson.attr('id',@$id)
		console.log '@$newperson : '+@$newperson.html()
		console.log '@$persons = '+@$persons.html()
		@$persons.append(@$newperson)
		info = new module.txteditor('#'+@$id+' .infos')
		name = new module.txteditor('#'+@$id+' .name')

		showserver = new module.showcloud($('#'+@$id+' img'))
		$('body').addClass 'savable'

	bindEvents: ->
		@$btn.on 'click', (event) =>
			console.log 'click'
			@addperson()

module.addpersons = addpersons

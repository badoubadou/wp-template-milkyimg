class txteditor
  constructor: (@$container) ->
    @setOptions()
    @bindEvents()

  setOptions: ->
    @$select = @$container
    console.log 'set options'+@$select

  bindEvents: ->
    $(window).load(@init)

  init: =>
    tinymce.init
	    selector: @$select,
	    inline: true

module.txteditor = txteditor

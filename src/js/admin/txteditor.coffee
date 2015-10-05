class txteditor
  constructor: (@$container) ->
    @setOptions()
    # @bindEvents()
    @init()

  setOptions: ->
    @$select = @$container
    console.log 'yo'+@$container

  # bindEvents: ->
  #   $(window).load(@init)

  init: =>
    tinyMCE.init
      selector: @$select
      inline: true
      mode: 'exact'
      setup: (editor) ->
        editor.on 'change', (e) ->
          console.log 'Editor was clicked'+e
          $('body').addClass 'savable'
    return

module.txteditor = txteditor

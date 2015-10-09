class txteditor
  constructor: (@$container) ->
    @setOptions()
    @init()
    # @getCont('cap0')

  setOptions: ->
    @$select = @$container
    @$tinymce
    console.log 'yo'+@$container

  getCont: (@$id)->
    console.log 'yo'+@$id
    # console.log $(@$id).tinyMCE().getContent();
    return tinyMCE.get(@$id).getContent()

  init: =>
    tinyMCE.init
      selector: @$select
      inline: true
      setup: (editor) ->
        editor.on 'focus', (e) ->
          console.log editor.id+'Editor was clicked'+editor.getContent()
          $('body').addClass 'savable'
    return

module.txteditor = txteditor

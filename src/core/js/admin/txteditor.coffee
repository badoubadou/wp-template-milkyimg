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
      menubar: "edit insert"
      plugins: ["link"]
      toolbar: "undo redo | styleselect | formatselect | bold italic | link"
      style_formats: [
        {
          title: 'Bold text'
          inline: 'b'
        }
        # {
        #   title: 'Red text'
        #   inline: 'span'
        #   styles: color: '#ff0000'
        # }
        # {
        #   title: 'Red header'
        #   block: 'h1'
        #   styles: color: '#ff0000'
        # }
        {
          title: 'romhand'
          inline: 'span'
          classes: 'romhand'
        }
        {
          title: 'stephhand'
          inline: 'span'
          classes: 'stephhand'
        }
      ]
      setup: (editor) ->
        editor.on 'focus', (e) ->
          console.log editor.id+'Editor was clicked'+editor.getContent()
          $('body').addClass 'savable'
    return

module.txteditor = txteditor

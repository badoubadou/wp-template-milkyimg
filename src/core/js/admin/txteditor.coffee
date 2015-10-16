class txteditor
  constructor: (@$container) ->
    @setOptions()
    @init()
    @hackPlaceHolder()
    # @getCont('cap0')


  hackPlaceHolder: ->
    txtplaceholder = $(@$container).data 'ph'
    # console.log $(@$container).find('br[data-mce-bogus="1"]').length + '??'
    if($(@$container).find('br[data-mce-bogus="1"]').length)
      $(@$container).find('p:first-child').addClass('placeholder').attr('data-ph', txtplaceholder)

  setOptions: ->
    @$select = @$container
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
        editor.on 'blur', (e) ->
          if($('#'+editor.id).find('br[data-mce-bogus="1"]').length)
            $('#'+editor.id).find('p:first-child').addClass('placeholder')
        editor.on 'focus', (e) ->
          $('#'+editor.id).find('.placeholder').removeClass('placeholder')
          console.log editor.id+'Editor was clicked'+editor.getContent()
          $('body').addClass 'savable'
    return

module.txteditor = txteditor

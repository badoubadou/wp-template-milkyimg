class txteditor
  constructor: (@$container) ->
    @setOptions()
    # @init()
    @bindinline()
    @hackPlaceHolder()

  hackPlaceHolder: ->
    txtplaceholder = $(@$container).data 'ph'
    if($(@$container).find('br[data-mce-bogus="1"]').length)
      $(@$container).find('p:first-child').addClass('placeholder').attr('data-ph', txtplaceholder)

  setOptions: ->
    @$select = $(@$container)
    console.log 'setOptions'+@$container

  getCont: (@$id)->
    $('#'+@$id).find('.placeholder').removeClass('placeholder')
    $('#'+@$id).find('[data-ph]').removeAttr('data-ph')
    if $('body').data 'idtiny'
      @removetiny()
    console.log $('#'+@$id).html()+ '.getCont '
    return $('#'+@$id).html()

  inline: (@el)->
    console.log @$idtiny + '@$idtiny'
    if(!@el.attr('id'))
      d = new Date
      $editable_id = 'editable_'+d.getTime()
      @el.attr('id', $editable_id)
    else
      $editable_id = @el.attr('id')
    if $('body').data 'idtiny'
      @removetiny($('body').data 'idtiny')
    $('body').data('idtiny',  $editable_id)
    @init('#'+$editable_id)

  removetiny: ->
    tinyMCE.EditorManager.execCommand('mceRemoveEditor',true, ($('body').data 'idtiny'))
    console.log '?? '+$('body').data('idtiny')
    $('body').data('idtiny', false)

  bindinline: ->
    _that = @
    @$select.each (index) ->
      if(!$(this).attr('id'))
        d = new Date
        $(this).attr('id', 'editable_'+index+'_'+d.getTime())
      return
    @$select.bind 'click', ->
      _that.inline($(this))
      return

  init: (@elid)->
    console.log @$idtiny + ' = @$idtiny init'
    tinyMCE.init
      selector: @elid
      # selector: @$select
      # inline: true
      menubar: false
      paste_auto_cleanup_on_paste : true
      paste_remove_styles: true
      paste_remove_styles_if_webkit: true
      paste_strip_class_attributes: "all"
      plugins: ["link", "paste"]
      content_css : "/css/style.css"
      toolbar: "undo redo | styleselect | bold italic | link"
      style_formats: [
        {
          title: 'Titre'
          block: 'h2'
        }
        {
          title: 'Sous-titre'
          block: 'h3'
        }
        {
          title: 'Date'
          inline: 'span'
          classes: 'date'
        }
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

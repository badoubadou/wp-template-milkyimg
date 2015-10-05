class showcloud
  constructor: (@$btn) ->
    @setOptions()
    @bindEvents()

  setOptions: ->
    @$btn = @$btn
    @$cloudfinder = $('.server')

  bindEvents: ->
    @$btn.on 'click', (event) =>
    	replaceimg = new module.replaceimg($(event.currentTarget))
    	@$cloudfinder.removeClass 'hidden'
    	$('body').addClass 'popin'

module.showcloud = showcloud

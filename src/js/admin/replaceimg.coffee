class replaceimg
  constructor: (@$cible) ->
    @setOptions()
    @bindEvents()

  setOptions: ->
    @$cible = @$cible
    @$cloudfinder = $('.server')
    @$btn = @$cloudfinder.find 'img'

  getContext: (@$el)->
    @$newsrc = @$el.attr('src')

  bindEvents: ->
    @$btn.on 'click', (event) =>
    	console.log 'click'+$()
    	@getContext($(event.currentTarget))
    	@$cible.attr('src',@$newsrc)
    	@$cloudfinder.addClass 'hidden'
    	$('body').removeClass 'popin'

module.replaceimg = replaceimg

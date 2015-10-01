class slider
  constructor: (@$container) ->
    @setOptions()
    @bindEvents()

  setOptions: ->
    console.log 'bind'
    @$flexslider = @$container.find('.flexslider')

  bindEvents: ->
    $(window).load(@init)

  init: =>
    @$flexslider.flexslider
      animation: 'slide'
      animationSpeed: 400
      smoothHeight: false
      slideshow: false

# module.exports = Default

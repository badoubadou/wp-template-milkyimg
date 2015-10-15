# TODO: extract to helpers
moveContainerTop = ($container, top) ->
  transform3dEnabled = $('html').hasClass 'csstransforms3d'
  transformEnabled = $('html').hasClass 'csstransforms'

  if transform3dEnabled
    $container.css
      'transform': 'translate3d(0, ' + top + 'px, 0)'
  else if transformEnabled
    $container.css
      'transform': 'translateY(' + top + 'px)'
  else
    $container.css
      'top': top + 'px'

# TODO: refactor/rewrite class???
class sliderfullscreen
  constructor: (@$container) ->
    @setOptions()
    @bindEvents()
    @insertspan()

  init: =>
    @resizeWindow()

    @$flexslider.flexslider
      animation: 'slide'
      animationSpeed: 400
      smoothHeight: false
      slideshow: false
      start: =>
        @sliderReady()
      after: =>
        @setSliderOptions()
        @resizeWindow()
        @startVideo()

  setOptions: ->
    @elementOffset = 0
    @elementHeight = 0
    @elementOffsetOrigin = @$container.offset().top
    @$flexslider = @$container.find('.flexslider')
    console.log '??? '+@$flexslider.html()

    @$flexslide = @$flexslider.find('li')
    @$containermedia = @$flexslider.find('.container-media')
    @$media = @$containermedia.find('.media')
    @setSliderOptions()

  setSliderOptions: ->
    @$activeSlider = @$flexslider.find '.flex-active-slide'
    @$background_holder = @$activeSlider.find '.media'
    @$foreground_holder = @$activeSlider.find '.container'
    @$embedVideo = @$activeSlider.find '.video'

  insertspan: ->
    @$caption = @$flexslider.find '.flex-caption'
    @$caption.each ->
      $(this).html($(this).html().replace(/<p>/g,'<p><span>').replace(/<\/p>/g,'</span></p>'))
      $(this).html($(this).html().replace(/<h3>/g,'<h3><span>').replace(/<\/h3>/g,'</span></h3>'))
      return



  sliderReady: ->
    @setSliderOptions()
    @resizeWindow()
    @doParallax()

  stopvideo: ->
    @$StopVideo = @$flexslider.find '.video'
    if @$StopVideo.length
      @$StopVideo.find('.iframe').empty()

  startVideo: ->
    @stopvideo()
    if @$embedVideo.length
      @$embedVideo.find('.iframe').html(@$embedVideo.find('.iframe').attr('data-html'))

  bindEvents: ->
    @init()
    # TODO: use global debounced events
    $(window)
    .on 'scroll touchmove', =>
      @doParallax()
    .on 'resize', =>
      @resizeWindow()
      @doParallax()

  doParallax: ->
    @scrollTop = $(window).scrollTop()
    overscroll = @scrollTop
    percentScrolled = (@elementOffset + @elementHeight) / (@scrollTop)
    percentScrolled = percentScrolled - .95
    percentScrolledText = percentScrolled - .6
    posChangeBackground = overscroll * .15
    posChangeContent = overscroll * .17

    moveContainerTop @$background_holder, posChangeBackground
    moveContainerTop @$foreground_holder, posChangeContent


  resizeWindow: ->
    console.log 'resize'
    newHeight = $(window).innerHeight() - @elementOffsetOrigin
    newRatio = @$container.innerWidth() / @$container.innerHeight()

    @$container.height newHeight
    @$flexslider.height newHeight
    @$flexslide.height newHeight
    @$containermedia.css('height',newHeight)
    @$media.height newHeight

module.sliderfullscreen = sliderfullscreen
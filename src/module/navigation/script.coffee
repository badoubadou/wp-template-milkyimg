class navigation
  constructor: (@$container) ->
    @setOptions()
    @navGroupWrapper = @$container.find('.nav-group-wrapper')
    @navItems = @$container.find('.nav-group li')
    @bindEvents()

  setOptions: ->
    @$root = $('html')
    @$mobileToggler = @$container.find '.toggle-burger'

  bindEvents: ->
    # activate nav items and their parents when clicked
    @$container.on 'click', '.nav-group a', (e) =>
      console.log 'click'
      $target = $(e.target)
      @navItems.removeClass 'active'
      parentItems = $target.parentsUntil(@navGroupWrapper, 'li').addClass 'active'
      if Modernizr.touch
        e.preventDefault()
        window.location = $target.attr('href')

    # toggle mobile nav
    @$mobileToggler.on 'click', (e) =>
      $target = $(e.target)
      console.log 'click'
      @$root.toggleClass 'navigation-active'
      @$container.toggleClass 'open'

    # toggle mobile nav animation (to prevent quirks)
    $(document).on 'switchedBreakpoint', (e, breakpoint) =>
      if breakpoint is 'mobile'
        @$container.addClass 'animate'
      else
        @$container.removeClass 'animate'

module.navigation = navigation

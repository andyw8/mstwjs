class Toggler
  detailSelector: ".detail"
  linkSelector: ".detail_toggle"
  hiddenClass: "hidden"
  hideText: "Hide Details"
  showText: "Show Details"
  container: ".topics_container"

  constructor: ->
    # note the use of the 'fat arrow' so that 'this' (@) gets set correctly
    $(@container).on 'click', @linkSelector, (event) =>
      @toggleOnClick event

  toggleOnClick: (event) ->
    @$link = $(event.target)
    # this seems hard to read to me, but CoffeeScript has no ternary operator.
    @$link.text if @isDetailHidden() then @hideText else @showText
    @detailElement().toggleClass @hiddenClass
    event.preventDefault()

  detailElement: ->
    @$link.parent().find @detailSelector

  isDetailHidden: ->
    @detailElement().hasClass @hiddenClass

$ ->
  toggler = new Toggler
  # we need to make Toggler global for it to be accessible from the spec
  # there are various approaches but this will work for now
  window.Toggler = Toggler

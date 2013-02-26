class Toggler
  detailSelector: ".detail"
  linkSelector: ".detail_toggle"
  hiddenClass: "hidden"
  container: ".topics_container"
  hideText: "Hide Details"
  showText: "Show Details"

  constructor: ->
    # note the use of the 'fat arrow' so that 'this' (@) gets set correctly
    $(@container).on 'click', @linkSelector, (event) =>
      @toggleOnClick event
    $(@linkSelector).on('ajax:success', (event, data, status, xhr) =>
      @detailElement().html data.description
    )
    $(@linkSelector).on('ajax:error', (event, xhr, status, error) ->
      alert error
    )

  toggleOnClick: (event) ->
    @$link = $(event.target)
    @$link.text if @isDetailHidden() then @hideText else @showText
    @detailElement().toggleClass this.hiddenClass

  detailElement: ->
    @$link.parent().find @detailSelector

  isDetailHidden: ->
    @detailElement().hasClass @hiddenClass

$ ->
  toggler = new Toggler
  # we need to make Toggler global for it to be accessible from the spec
  # there are various approaches but this will work for now
  window.Toggler = Toggler

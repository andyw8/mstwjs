describe "Topic detail toggler", ->
  beforeEach ->
    loadFixtures "topic.html"
    @toggler = new Toggler # not instance in book?
    # why does book2 say toggler.init() ?
    # fakeTarget = ->

    spyOn(@toggler, 'getDescription').andCallThrough()
    # spyOn($, 'get').andCallFake((ajaxParams) ->
    #   ajaxParams.success("Description")
    # )

  it "hides the detail by default", ->
    expect($('.detail')).toHaveClass "hidden"

  describe "clicking a show link", ->
    beforeEach ->
      $(".detail_toggle").click()

    it "shows the topic description", ->
      expect($('.detail')).not.toHaveClass "hidden"

    it "changes the link description to Hide", ->
      expect($('.detail_toggle')).toHaveText "Hide Details"

    it 'Changes the link action back to Show', ->
      $(".detail_toggle").click()
      expect($('.detail_toggle')).toHaveText "Show Details"

    it "calls the ajax with the correct url", ->
      $target = @toggler.getDescription.mostRecentCall.args[0]
      expect($target).toHaveClass "detail"

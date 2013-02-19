describe "Trip detail toggler", ->
  beforeEach ->
    loadFixtures "topic.html"
    toggler = new Toggler()
    toggler.init()

  it "hides the detail by default", ->
    expect($('.detail')).toHaveClass "hidden"

  describe "clicking a show link", ->
    beforeEach ->
      $(".detail_toggle").click()

    it "shows the trip description", ->
      expect($('.detail')).not.toHaveClass "hidden"

    it "changes the link description to Hide", ->
      expect($('.detail_toggle')).toHaveText "Hide Details"

    it 'Changes the link action back to Show',->
      $(".detail_toggle").click()
      expect($('.detail_toggle')).toHaveText "Show Details"

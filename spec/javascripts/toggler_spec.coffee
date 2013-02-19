describe "Trip detail toggler", ->
  describe "clicking a show link", ->
    beforeEach ->
      loadFixtures "topic.html"
      toggler = new Toggler()
      toggler.init()

    it "hides the detail by default", ->
      expect($('.detail')).toHaveClass "hidden"

    it "shows the trip description", ->
      $(".detail_toggle").click()
      expect($('.detail')).not.toHaveClass "hidden"

    it "changes the link description to hide", ->
      $(".detail_toggle").click()
      expect($('.detail_toggle')).toHaveText "Hide Details"

    it 'Changes the link action back to "Show"',->
      $(".detail_toggle").click()
      $(".detail_toggle").click()
      expect($('.detail_toggle')).toHaveText "Show Details"

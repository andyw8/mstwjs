describe("Trip detail toggler", function() {
  describe("clicking a show link", function() {
    beforeEach(function(){
      loadFixtures("topic.html");
      toggler.init();
    });

    it("hides the detail by default", function() {
      expect($('.detail')).toHaveClass("hidden");
    });

    it("shows the trip description", function() {
      $(".detail_toggle").click();
      expect($('.detail')).not.toHaveClass("hidden");
    });

    it("changes the link description to hide", function(){
      $(".detail_toggle").click();
      expect($('.detail_toggle')).toHaveText("Hide Details");
    });

    it('Changes the link action back to "Show"',function(){
      $(".detail_toggle").click();
      $(".detail_toggle").click();
      expect($('.detail_toggle')).toHaveText("Show Details");
    });
  });
});

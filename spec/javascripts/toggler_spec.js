describe("Trip detail toggler", function() {
  describe("clicking a show link", function() {
    it("shows the trip description", function() {
      loadFixtures("product.html");
      init();
      expect($('.detail')).toHaveClass("hidden");
      $(".detail_toggle").click();
      expect($('.detail')).not.toHaveClass("hidden");
    });
  });
});

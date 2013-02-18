function init() {
  var $toggle_links = $(".detail_toggle");
  $toggle_links.click(function(event) {
    $detail = $(this).siblings(".detail");
    $detail.toggleClass("hidden");

    var linkLabelText;
    if($detail.hasClass("hidden")) {
      linkLabelText = "Show Details";
    } else {
      linkLabelText = "Hide Details";
    }
    $(this).text(linkLabelText);

    event.preventDefault();
  });
}

$(function() {
  init();
});

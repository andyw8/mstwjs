var toggler = {
  detailSelector: ".detail",
  linkSelector: ".detail_toggle",
  hiddenClass: "hidden",
  hideText: "Hide Details",
  showText: "Show Details",
  container: ".topics_container",

  init: function() {
    var self = this;
    $(this.container).on('click', toggler.linkSelector, function(event) {
      self.toggleOnClick(event);
    });
  },

  toggleOnClick: function(event){
    this.$link = $(event.target);
    if ( this.isDetailHidden() ) {
      this.$link.text( this.hideText );
    } else {
      this.$link.text( this.showText );
    }
    this.detailElement().toggleClass(this.hiddenClass);
    event.preventDefault();
  },

  detailElement: function() {
    return this.$link.parent().find(this.detailSelector);
  },

  isDetailHidden: function() {
    return this.detailElement().hasClass(this.hiddenClass);
  }
};

$(function() {
  toggler.init();
});

var Toggler = (function() {
  var totalTogglers = 0;
  var Toggler = function() {
    this.detailSelector = ".detail";
    this.linkSelector = ".detail_toggle";
    this.hiddenClass = "hidden";
    this.hideText = "Hide Details";
    this.showText = "Show Details";
    this.container = ".topics_container";
  };

  Toggler.prototype = {
    init: function() {
      var toggler = this;
      $(this.container).on('click', this.linkSelector, function(event) {
        toggler.toggleOnClick(event);
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

  return Toggler;
})();

$(function() {
  var toggler = new Toggler();
  toggler.init();
});

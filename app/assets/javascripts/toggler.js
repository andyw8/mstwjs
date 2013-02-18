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
    // inside the jQuery event handler, this refers to the event, so we must
    // re-assign the origin 'this' so we can call it from within the event handler
    var self = this;
    $(this.container).on('click', this.linkSelector, function(event) {
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
  var toggler = new Toggler();
  toggler.init();
});

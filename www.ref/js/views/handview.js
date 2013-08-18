
/* Views *******************************************************************************************/


window.HomeView = Backbone.View.extend({
  tagName:"div",
  
  className: "home",

  events: {
    "click .play-now-button": "playNow"
  },

  initialize:function() {},

  playNow: function() {
    console.log("Play now pressed");
    app.navigate("#packMenu", {trigger: true});
  },

  render: function () {

    $(this.el).html(this.template());
    return this;
  }
});


window.PackEntryView = Backbone.View.extend({
  tagName:"li",
  
  className: "pack-entry",

  events: {
    "click": "selected"
  },

  initialize:function() {
    this.model.fetch();
    this.model.on("change", this.render, this);
  },

  selected: function() {
    app.navigate("#packStore/" + this.model.get("id"), {trigger: true});
    console.log("selected " + this.model.get("id"));
  },

  render: function () {
    var thumbUrl = "img/new/loadingPack@2x.png";
    if (this.model.get("image")) {
      thumbUrl = "http://instapoker-staging.herokuapp.com/api/" + this.model.get("image");
    }

    // $(this.el).html(this.template());
    this.$el.css({
      background: "transparent url(" + thumbUrl + ")",
      "background-size": "100% 100%",
      // top: window.Positions.scale.y * 20 + "px",
      // left: window.Positions.scale.x * (152 * this.options.index + 30) + "px",
      float: "left",
      // display: "inline",
      margin: window.Positions.scale.x * 10+ "px",
      width: window.Positions.scale.x * 152+ "px",
      height: window.Positions.scale.y * 162 + "px"
    });
    
    return this;
  }
});

window.PackMenuView = Backbone.View.extend({
  tagName:"div",
  
  className: "pack-menu",

  initialize:function() {},

  render: function () {

    $(this.el).html(this.template());
  
    var self = this;
    _.each(this.model.models, function(model) {
      var packEntryView = new PackEntryView({model: model});
      $(packEntryView.render().el).appendTo($("ul", self.$el));      
    });
  
    var galleryPosition = window.Positions.packGallery;
    $("#pack-wrapper", this.$el).css({
      position: "absolute",
    	overflow: "auto",
      top: window.Positions.scale.y * galleryPosition.top + "px",
      left: window.Positions.scale.x * galleryPosition.left + "px",
      width: window.Positions.scale.x * galleryPosition.width + "px",
      height: window.Positions.scale.y * galleryPosition.height + "px"               
    });

    return this;
  }
});



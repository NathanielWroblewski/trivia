

window.Router = Backbone.Router.extend({

  routes: {
    "": "home",
    "packMenu": "packMenu",
    "packStore/:id": "packStore",
  },

  initialize: function () {
  },

  home: function() {
    console.log("******** size:"+window.innerWidth+"x"+window.innerHeight);
    this.homeView = new HomeView();
    $("#content").html(this.homeView.el);    
    this.homeView.render();
  },

  packMenu: function() {
    var packListModel = this.packListModel = new PackListModel();
    packListModel.fetch({success:function(packs) {
      var packMenuView = new PackMenuView({model: packListModel});
      $("#content").html(packMenuView.el);    
      packMenuView.render();
    }, error: function(err) {
      console.log("error:"+err);
    }}, {add: true});
  },
});

jQuery(function() {
  deviceReady();
  myScroll = new iScroll('wrapper');
  vScroll = new iScroll('pack-wrapper', { hScrollbar: false, vScrollbar: false, vScroll: false });
});

function deviceReady() {
  templateLoader.load([
    "HomeView",
    "PackMenuView"],
      function () {
          app = new Router();
          Backbone.history.start();
      });  
}

document.addEventListener("deviceready", deviceReady, true);

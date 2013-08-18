
window.PackModel = Backbone.Model.extend({
  initialize: function() {},
  
  url: function() {
   return "http://www.foo.com/api/packs/"+this.id;
  }
});

window.PackListModel = Backbone.Collection.extend({
  model: window.PackModel,

  initialize: function() {},

  url: "http://www.foo.com/api/packs",

  parse: function(data) {
    return _.map(data["pack-list"], function(packName) {
      return {id: packName};
    });
  }
});



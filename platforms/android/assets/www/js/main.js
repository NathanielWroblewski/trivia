// Generated by CoffeeScript 1.6.3
(function() {
  var deviceReady;

  window.Router = Backbone.Router.extend({
    routes: {
      '': 'home_page',
      'dealer_game_new': 'dealer_game_new',
      'player_games_index': 'player_games_index',
      'player_card_view': 'player_card_view',
      'dealer_deck_index': 'dealer_deck_index',
      'dealer_game_show': 'dealer_game_show',
      'dealer_stats_show': 'dealer_stats_show',
      'game_over': 'game_over'
    },
    initialize: function() {},
    home_page: function() {
      this.homePageView = new HomePageView();
      $('#content').html(this.homePageView.el);
      return this.homePageView.render();
    },
    dealer_game_new: function() {
      this.dealerGameNewView = new DealerGameNewView();
      $('#content').html(this.dealerGameNewView.el);
      return this.dealerGameNewView.render();
    },
    player_games_index: function() {
      this.playerGamesIndexView = new PlayerGamesIndexView();
      $('#content').html(this.playerGamesIndexView.el);
      return this.playerGamesIndexView.render();
    },
    player_card_view: function() {
      this.playerCardView = new playerCardView();
      $('#content').html(this.playerCardView.el);
      return this.playerCardView.render();
    },
    dealer_deck_index: function() {
      this.dealerDeckIndexView = new DealerDeckIndexView();
      $('#content').html(this.dealerDeckIndexView.el);
      return this.dealerDeckIndexView.render();
    },
    dealer_game_show: function() {
      this.dealerGameShowView = new DealerGameShowView();
      $('#content').html(this.dealerGameShowView.el);
      return this.dealerGameShowView.render();
    },
    dealer_stats_show: function() {
      this.dealerStatsShowView = new DealerStatsShowView();
      $('#content').html(this.dealerStatsShowView.el);
      return this.dealerStatsShowView.render();
    }
  });

  deviceReady = function() {
    return templateLoader.load(['HomePageView', 'DealerGameNewView', 'DealerDeckIndexView', 'DealerGameShowView', 'DealerStatsShowView', 'PlayerGamesIndex', 'PlayerCardView'], function() {
      window.app = new Router();
      return Backbone.history.start();
    });
  };

  window.deviceReady = deviceReady;

  document.addEventListener('deviceReady', deviceReady, true);

}).call(this);

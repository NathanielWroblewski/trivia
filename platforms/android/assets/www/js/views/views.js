// Generated by CoffeeScript 1.6.3
(function() {
  window.HomePageView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'home-page',
    events: {
      'click #new-button': 'routeToDealerPath',
      'click #join-button': 'routeToPlayerPath'
    },
    render: function() {
      this.$el.html(this.template());
      return this;
    },
    routeToDealerPath: function() {
      return window.app.navigate('#dealer_game_new', {
        trigger: true
      });
    },
    routeToPlayerPath: function() {
      return window.app.navigate('#player_games_index', {
        trigger: true
      });
    }
  });

  window.DealerGameNewView = Backbone.View.extend({
    tagName: 'div',
    events: {
      'click #dng-next': 'instantiateDealerAndGame',
      'click .dealer-cancel': 'returnToHomePage'
    },
    render: function() {
      this.$el.html(this.template());
      return this;
    },
    instantiateDealerAndGame: function(e) {
      var dealerName, gameName;
      gameName = $('.dealer-game-name').val();
      dealerName = $('.dealer-dealer-name').val();
      this.gameModel = new GameModel({
        name: gameName
      });
      this.dealerModel = new DealerModel({
        name: dealerName
      });
      window.game = this.gameModel;
      window.dealer = this.dealer;
      return window.app.navigate('#dealer_game_show', {
        trigger: true
      });
    },
    returnToHomePage: function() {
      return window.app.navigate('', {
        trigger: true
      });
    }
  });

  window.DealerDeckIndexView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'dealer-deck-index',
    events: {
      'click .dealer-deck-name': 'retrieveDeck',
      'click .dealer-get-decks': 'purchaseDeck',
      'click .dealer-make-deck': 'constructDeck'
    },
    retrieveDeck: function() {
      return window.app.navigate('#dealer_game_show');
    },
    purchaseDeck: function() {
      return window.app.navigate('#dealer_game_show');
    },
    constructDeck: function() {
      return window.app.navigate('#dealer_game_show');
    }
  });

  window.DealerGameShowView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'dealer-game-show',
    events: {
      'click .card-swipe-area': 'flickCard',
      'click .flip-button': 'nextCard'
    },
    render: function() {
      this.$el.html(this.template());
      return this;
    },
    flickCard: function() {
      $('.card-swipe-area').addClass('hidden');
      $('.flip-button').removeClass('hidden');
      return {
        'card': 'Cards-11.png'
      };
    },
    nextCard: function() {
      $('.flip-button').addClass('hidden');
      return $('.card-swipe-area2').removeClass('hidden');
    }
  });

  window.DealerStatsShowView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'dealer-stats-show',
    render: function() {
      this.$el.html(this.template());
      return this;
    }
  });

  window.PlayerGamesIndexView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'player-games-index',
    render: function() {
      this.$el.html(this.template());
      return this;
    },
    events: {
      'click .player-join-game': 'joinGame'
    },
    joinGame: function() {
      return window.app.navigate('#player_start_game');
    }
  });

  window.PlayerCardView = Backbone.View.extend({
    initialize: function() {},
    tagName: 'div',
    className: 'player-card-view',
    render: function() {
      this.$el.html(this.template());
      return this;
    }
  });

}).call(this);

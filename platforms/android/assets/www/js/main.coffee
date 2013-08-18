window.Router = Backbone.Router.extend
  routes:
    '': 'home_page'
    'dealer_game_new': 'dealer_game_new'
    'player_games_index': 'player_games_index'
    'player_card_view': 'player_card_view'
    'dealer_deck_index': 'dealer_deck_index'
    'dealer_game_show': 'dealer_game_show'
    'dealer_stats_show': 'dealer_stats_show'
    'game_over': 'game_over'


  initialize: ->

  home_page: ->
    @.homePageView = new HomePageView()
    $('#content').html @.homePageView.el
    @.homePageView.render()

  dealer_game_new: ->
    @.dealerGameNewView = new DealerGameNewView()
    $('#content').html @.dealerGameNewView.el
    @.dealerGameNewView.render()

  player_games_index: ->
    @.playerGamesIndexView = new PlayerGamesIndexView()
    $('#content').html @.playerGamesIndexView.el
    @.playerGamesIndexView.render()

  player_card_view: ->
    @.playerCardView = new playerCardView()
    $('#content').html @.playerCardView.el
    @.playerCardView.render()
      
  dealer_deck_index: ->
    @.dealerDeckIndexView = new DealerDeckIndexView()
    $('#content').html @.dealerDeckIndexView.el
    @.dealerDeckIndexView.render()

  dealer_game_show: ->
    @.dealerGameShowView = new DealerGameShowView()
    $('#content').html @.dealerGameShowView.el
    @.dealerGameShowView.render()

  dealer_stats_show: ->
    @.dealerStatsShowView = new DealerStatsShowView()
    $('#content').html @.dealerStatsShowView.el
    @.dealerStatsShowView.render()


deviceReady = ->
  templateLoader.load [
    'HomePageView'
    'DealerGameNewView'
    'DealerDeckIndexView'
    'DealerGameShowView'
    'DealerStatsShowView'
    'PlayerGamesIndex'
    'PlayerCardView'
  ], ->
    window.app = new Router()
    Backbone.history.start()

window.deviceReady = deviceReady


document.addEventListener 'deviceReady', deviceReady, true

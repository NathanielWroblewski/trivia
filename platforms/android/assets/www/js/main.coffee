deviceReady = ->
  templateLoader.load [
    'HomePageView'
    'DealerGameNewView'
    'DealerDeckIndexView'
    'DealerGameShowView'
    'DealerStatsShowView'
  ], ->
    app = new Router()
    Backbone.history.start()

document.addEventListener 'deviceReady', deviceReady, true

window.Router = Backbone.Router.extend
  routes:
  	'home_page': 'home_page'
  	'dealer_game_new': 'dealer_game_new'
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

window.deviceReady = deviceReady

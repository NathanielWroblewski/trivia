window.HomePageView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'home-page'

  events:
    'click .dealer-path': 'routeToDealerPath'
    'click .player-path': 'routeToPlayerPath'

  render: ->
    @.$el.html @.template()
    @

  routeToDealerPath: ->
    app.navigate '#dealer_game_new',
      trigger: true

  routeToPlayerPath: ->
    app.navigate ''

################## DEALER PATH ###################

window.DealerGameNewView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'dealer-game-new'

  events: 
    'click .dealer-new-game-button': 'instantiateDealerAndGame'
    'click .cancel': 'returnToHomePage'

  render: ->
    @.$el.html @.template()
    @

  instantiateDealerAndGame: ->
    gameName = $('.dealer-game-name').val()
    dealerName = $('.dealer-dealer-name').val()
    @.gameModel = new GameModel
      name: gameName
    @.dealerModel = new DealerModel
      name: dealerName
    app.navigate '#dealer_deck_index',
      trigger: true

  returnToHomePage: ->
  	app.navigate '#home_page',
  	  trigger: true

window.DealerDeckIndexView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'dealer-deck-index'

  events:
  	'click .dealer-deck-name': 'retrieveDeck'
  	'click .dealer-get-decks': 'purchaseDeck'
  	'click .dealer-make-deck': 'constructDeck'

  retrieveDeck: ->
  	# RetrieveDeckCollection
  	app.navigate '#dealer_game_show'

  purchaseDeck: ->
  	# Purchase a Deck Through PayPal
  	app.navigate '#dealer_game_show'

  constructDeck: ->
  	# Contruct a Deck
  	app.navigate '#dealer_game_show'

window.DealerGameShowView = Backbone.View.extend
  initialize: ->
  
  tagName: 'div'
  className: 'dealer-game-show'

  # events: swipe up, swipe left/right, flip button

  render: ->
  	@.$el.html @.template()
  	@

window.DealerStatsShowView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'dealer-stats-show'

  # events

  render: ->
  	@.$el.html @.template()
  	@

# window.NavBar = Backbone.View.extend
#   tagName: 'nav'
#   className: 'navbar'
#   events: 
#   	'click .nav-players-button': 'playersButton'
#   	'click .nav-score-button': 'scoreButton'
#   	'click .nav-game-button': 'gameButton'

#   initialize: ->

#   playersButton: ->


#   scoreButton: ->


#   gameButton: ->

#   render: ->
#   	@.$el.html @.template()
#   	@


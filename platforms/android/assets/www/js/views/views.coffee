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
    window.app.navigate '#dealer_game_new',
      trigger: true

  routeToPlayerPath: ->
    window.app.navigate '#player_games_index'
      trigger: true

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
    window.app.navigate '#dealer_deck_index',
      trigger: true

  returnToHomePage: ->
  	window.app.navigate '',
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
  	window.app.navigate '#dealer_game_show'

  purchaseDeck: ->
  	# Purchase a Deck Through PayPal
  	window.app.navigate '#dealer_game_show'

  constructDeck: ->
  	# Contruct a Deck
  	window.app.navigate '#dealer_game_show'

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

window.PlayerGamesIndexView = Backbone.View.extend # NEED TO MAKE TMP!!!!
  initialize: ->

  # function (args) {  
#         _.bindAll(this, 'changeName');  
#           this.model.bind('change:name', this.changeName);  
# },  
# });  

  tagName: 'div'
  className: 'player-games-index'

  render: ->
    @.$el.html @.template()
    @

  events:
    'click .player-join-game': 'joinGame'

  joinGame: ->
    window.app.navigate '#player_start_game'
    

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


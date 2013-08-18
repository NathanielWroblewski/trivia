window.HomePageView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'home-page'

  events:
    'click #new-button': 'routeToDealerPath'
    'click #join-button': 'routeToPlayerPath'

  render: ->
    @.$el.html @.template()
    @

  routeToDealerPath: ->
    window.app.navigate '#dealer_game_new',
      trigger: true

  routeToPlayerPath: ->
    window.app.navigate '#player_games_index',
      trigger: true

################## DEALER PATH ###################

window.DealerGameNewView = Backbone.View.extend
  # initialize: ->

  tagName: 'div'
  # className: 'dealer-game-new'

  events: 
    'click #dng-next': 'instantiateDealerAndGame'
    'click .dealer-cancel': 'returnToHomePage'

  render: ->
    @.$el.html @.template()
    @

  instantiateDealerAndGame: (e) ->
    gameName = $('.dealer-game-name').val()
    dealerName = $('.dealer-dealer-name').val()
    @.gameModel = new GameModel
      name: gameName
    @.dealerModel = new DealerModel
      name: dealerName
    window.game = @.gameModel
    window.dealer = @.dealer
    window.app.navigate '#dealer_game_show',
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
  	# RetrieveCardCollection
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

  events:
    'click .card-swipe-area': 'flickCard'
    'click .flip-button': 'nextCard'

  render: ->
    @.$el.html @.template()
    @

  flickCard: ->
    $('.card-swipe-area').addClass 'hidden'
    $('.flip-button').removeClass 'hidden'
    'card': 'Cards-11.png'

  nextCard: ->
    $('.flip-button').addClass 'hidden'
    $('.card-swipe-area2').removeClass 'hidden'

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
    
window.PlayerCardView = Backbone.View.extend
  initialize: ->

  tagName: 'div'
  className: 'player-card-view'    

  render: ->
    @.$el.html @.template()
    @

  # events:
  #   'click #choice-a':    
  #   'click #choice-b':    
  #   'click #choice-c':    
  #   'click #choice-d':    

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


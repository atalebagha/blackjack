# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('endTurn', @dealerTurn, @)
    # @get('playerHand').on('lose') => @lose()
    @get('dealerHand').on('lose', @lose, @)
    @get('playerHand').on('lose', @lose, @)


  dealerTurn: ->
    @get('dealerHand').first().flip()
    score = @get('dealerHand').scores()
    while score < 17
      @get('dealerHand').hit()
      score = @get('dealerHand').scores()
    if score > 21
      @lose()
    else
      @getWinner()

  lose: ->
    console.log 'lose invoked'
    a = @get('dealerHand').scores()
    b = @get('playerHand').scores()
    if a > 21
      @trigger 'player-win'
    else
      @trigger 'dealer-win'
    # @resetGame()

  getWinner: ->
    console.log 'getWinner invoked'
    a = @get('dealerHand').scores()
    b = @get('playerHand').scores()
    if a > b
      @trigger 'dealer-win'
    # send trigger for view to alert 'Dealer Wins'
    else if a == b
     @trigger 'tie'
     # send trigger for view to alert 'Tie Game'
    else
     @trigger 'player-win'
    # @resetGame();

  # resetGame: ->
  #   @set 'deck', deck = new Deck()
  #   @set 'playerHand', deck.dealPlayer()
  #   @set 'dealerHand', deck.dealDealer()








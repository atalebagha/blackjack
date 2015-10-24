class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)
    @on 'compare' @compare

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

  compare: ->
    if @dealDealer.score < @dealPlayer.score && @dealPlayer.score <= 21
      @trigger 'win' @
    else @trigger 'lose' @
    console.log 'compare was invoked and a trigger was called'

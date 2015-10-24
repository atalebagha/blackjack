class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.on('dealer-win',
      () ->
        alert 'Dealer Wins!'
        # window.location.reload()
      , @)
    @model.on('player-win',
      () ->
        alert 'Player Wins!'
        # window.location.reload()
      , @)
    @model.on('tie',
      () ->
        alert 'Tie Game!'
        # window.location.reload()
      , @)

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  # showWinner: (event) ->
  #   if event == 'dealer-win'
  #     alert 'Dealer Wins'
  #     @model.initialize()
  #   else if event == 'player-win'
  #     alert 'Player Wins'
  #     @model.initialize()
  #   else if event == 'tie'
  #     alert 'Tie Game'
  #     @model.initialize()
    #listen for @model.getWinner()
    # 'dealer-win'
    # 'tie'
    # 'player-win'

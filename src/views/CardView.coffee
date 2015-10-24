class window.CardView extends Backbone.View
  tagName: 'img'
  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<%= image %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.attr "src", @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'


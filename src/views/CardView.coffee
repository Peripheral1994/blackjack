class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img height=142 width=102 src="../2015-06-blackjack/img/cards/<%= rankName %>-<%= suitName %>.png">'



  initialize: -> @render()

  render: ->
     @$el.addClass 'covered'
     if @model.get 'revealed'
        @$el.removeClass 'covered'
        @$el.html @template @model.attributes



    # @$el.children().detach()
    # @$el.html @template @model.attributes
    # @$el.addClass 'covered' unless @model.get 'revealed'

#'<img src="../img/cards/

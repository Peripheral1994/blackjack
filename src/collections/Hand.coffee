class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @scores()[0] > 21 then $('body').css('background-color': 'red')

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  stand: ->
    @dealerTurn()

  maxScore: ->
    if @scores()[1] < 22
      @scores()[1]
    else
      @scores()[0]

  dealerTurn: ->
    @at(0).flip()
    while @maxScore() < 17
      @add(@deck.pop())
    if @maxScore() < 22
      @trigger('endGame')
    else
      $('body').css('background-color': 'lightgreen')

  newGame: ->
    @trigger('newGame')
  
#trigger 'endGame'
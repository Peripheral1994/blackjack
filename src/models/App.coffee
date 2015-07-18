# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    #if deck has at least 16 cards, don't get a new deck, otherwise, get new deck and tell player deck is shuffled.
    @set 'deck', deck = new Deck()
    @dealHands()

  endGame: ->
    dHand = @get('dealerHand').maxScore()
    pHand = @get('playerHand').maxScore()
    if dHand > pHand
      $('body').css('background-color': 'red')
    if dHand < pHand
      $('body').css('background-color': 'lightgreen')
    if dHand == pHand
      $('body').css('background-color': 'yellow')

  newGame: ->
    $('body').css('background-color': 'white')
    if @get('deck').length > 15
      @dealHands()
    else
      alert('Deck is too small, shuffling!')
      @set 'deck', deck = new Deck()
      @dealHands()

  dealHands: ->
      @set 'playerHand', @get('deck').dealPlayer()
      @set 'dealerHand', @get('deck').dealDealer()
      @get('dealerHand').on('endGame', @endGame, @)
      @get('playerHand').on('newGame', @newGame, @)   



#Showing 21 as 11
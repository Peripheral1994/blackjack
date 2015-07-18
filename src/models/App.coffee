# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    #if deck has at least 16 cards, don't get a new deck, otherwise, get new deck and tell player deck is shuffled.
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on('endGame', @endGame, @)
    @get('playerHand').on('newGame', @newGame, @)

  endGame: ->
    dHand = @get('dealerHand').scores()
    pHand = @get('playerHand').scores()
    if dHand[1] < 22
      if pHand[1] < 22
        if dHand[1] > pHand[1]
          $('body').css('background-color': 'red')
        if dHand[1] < pHand[1]
          $('body').css('background-color': 'lightgreen')
        if dHand[1] == pHand[1]
          $('body').css('background-color': 'yellow')
      else 
        if dHand[1] > pHand[0]
          $('body').css('background-color': 'red')
        if dHand[1] < pHand[0]
          $('body').css('background-color': 'lightgreen')
        if dHand[1] == pHand[0]
          $('body').css('background-color': 'yellow')
    else 
      if pHand[1] < 22
        if dHand[0] > pHand[1]
          $('body').css('background-color': 'red')
        if dHand[0] < pHand[1]
          $('body').css('background-color': 'lightgreen')
        if dHand[0] == pHand[1]
          $('body').css('background-color': 'yellow')
      else 
        if dHand[0] > pHand[0]
          $('body').css('background-color': 'red')
        if dHand[0] < pHand[0]
          $('body').css('background-color': 'lightgreen')
        if dHand[0] == pHand[0]
          $('body').css('background-color': 'yellow')

  newGame: ->
    # if @get('deck').length > 15
    #   @set 'playerHand', deck.dealPlayer()
    #   @set 'dealerHand', deck.dealDealer()
    # else
      alert('Deck is too small, shuffling!')
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      @get('dealerHand').on('endGame', @endGame, @)
      @get('playerHand').on('newGame', @newGame, @)    



#Showing 21 as 11
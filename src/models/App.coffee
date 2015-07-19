# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    #if deck has at least 16 cards, don't get a new deck, otherwise, get new deck and tell player deck is shuffled.
    @playerMoney = 1000
    @bet = 0
    @set 'deck', deck = new Deck()
    @dealHands()

  endGame: ->
    dHand = @get('dealerHand').maxScore()
    pHand = @get('playerHand').maxScore()
    if pHand == 21 && @get('playerHand').length == 2
      $('h2').text('Player Blackjack!')
    else
      if dHand > pHand
        $('h2').text('Dealer Wins!')
      if dHand < pHand
        $('h2').text('Player Wins!')
        @playerMoney += @bet * 2
      if dHand == pHand
        $('h2').text('You Push!')
        @playerMoney += @bet

  newGame: ->
    $('body').css('background-color': 'white')
    if @get('deck').length > 15
      @dealHands()
    else
      alert('Deck is too small, shuffling!')
      @set 'deck', deck = new Deck()
      @dealHands()

  dealHands: ->
      @makeBet()
      @set 'playerHand', @get('deck').dealPlayer()
      @set 'dealerHand', @get('deck').dealDealer()
      @get('dealerHand').on('endGame', @endGame, @)
      @get('playerHand').on('newGame', @newGame, @)

  makeBet: ->
    @bet = parseInt(prompt("How much money would you like to bet? You have #{@playerMoney} dollars."))
    if typeof @bet is "number"
      if @bet > @playerMoney
        alert('You don\'t have that much money. Please try again!')
        @makeBet()
      else
        @playermoney -= @bet
    # else
    #   alert('That\'s not a number! Please try again!')
    #   @makeBet()
    #If you bet letters, it counts as 0.



#Showing 21 as 11
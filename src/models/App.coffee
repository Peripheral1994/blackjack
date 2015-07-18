# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on('endGame', -> @endGame, @)

  endGame: ->
    dHand = @get('dealerHand').scores()
    pHand = @get('playerHand').scores()
    if dHand[1] < 22
      if pHand[1] < 22
        if dHand[1] >= pHand[1]
          alert("Dealer Wins!")
        if dHand[1] < pHand[1]
          alert("Player Wins")
      else 
        if dHand[1] >= pHand[0]
          alert("Dealer Wins!")
        if dHand[1] < pHand[0]
          alert("Player Wins!")
    else 
      if pHand[1] < 22
        if dHand[0] >= pHand[1]
          alert("Dealer Wins!")
        if dHand[0] < pHand[1]
          alert("Player Wins")
      else 
        if dHand[0] >= pHand[0]
          alert("Dealer Wins!")
        if dHand[0] < pHand[0]
          alert("Player Wins!")  


#Showing 21 as 11
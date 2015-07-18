class window.Game extends Backbone.Model
  initialize: ->
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()
    # @on('stand', -> @endGame())
      

  # endGame: ->
  #   if dealerHand.scores()[1] < 22
  #     if playerHand.scores()[1] < 22
  #       if dealerHand.scores()[1] >= playerHand.scores()[1]
  #         alert("Dealer Wins!")
  #       if dealerHand.scores()[1] < playerHand.scores()[1]
  #         alert("Player Wins")
  #     else 
  #       if dealerHand.scores()[1] >= playerHand.scores()[0]
  #         alert("Dealer Wins!")
  #       if dealerHand.scores()[1] < playerHand.scores()[0]
  #         alert("Player Wins!")
  #   else 
  #     if playerHand.scores()[1] < 22
  #       if dealerHand.scores()[0] >= playerHand.scores()[1]
  #         alert("Dealer Wins!")
  #       if dealerHand.scores()[0] < playerHand.scores()[1]
  #         alert("Player Wins")
  #     else 
  #       if dealerHand.scores()[0] >= playerHand.scores()[0]
  #         alert("Dealer Wins!")
  #       if dealerHand.scores()[0] < playerHand.scores()[0]
  #         alert("Player Wins!")  
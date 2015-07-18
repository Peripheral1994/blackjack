// Generated by CoffeeScript 1.9.3
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

window.App = (function(superClass) {
  extend(App, superClass);

  function App() {
    return App.__super__.constructor.apply(this, arguments);
  }

  App.prototype.initialize = function() {
    var deck;
    this.set('deck', deck = new Deck());
    this.set('playerHand', deck.dealPlayer());
    this.set('dealerHand', deck.dealDealer());
    return this.get('dealerHand').on('endGame', this.endGame, this);
  };

  App.prototype.endGame = function() {
    var dHand, pHand;
    dHand = this.get('dealerHand').scores();
    pHand = this.get('playerHand').scores();
    if (dHand[1] < 22) {
      if (pHand[1] < 22) {
        if (dHand[1] >= pHand[1]) {
          alert("Dealer Wins!");
        }
        if (dHand[1] < pHand[1]) {
          return alert("Player Wins");
        }
      } else {
        if (dHand[1] >= pHand[0]) {
          alert("Dealer Wins!");
        }
        if (dHand[1] < pHand[0]) {
          return alert("Player Wins!");
        }
      }
    } else {
      if (pHand[1] < 22) {
        if (dHand[0] >= pHand[1]) {
          alert("Dealer Wins!");
        }
        if (dHand[0] < pHand[1]) {
          return alert("Player Wins");
        }
      } else {
        if (dHand[0] >= pHand[0]) {
          alert("Dealer Wins!");
        }
        if (dHand[0] < pHand[0]) {
          return alert("Player Wins!");
        }
      }
    }
  };

  return App;

})(Backbone.Model);

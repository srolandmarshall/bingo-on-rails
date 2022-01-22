import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["appendBingoCard", "removeAllBingoCards"]

  // How do you pass arguments to a controller method in Stimulus?
  // https://github.com/hotwired/stimulus/issues/64
  // Via `event.target.dataset`, you can get data attributes from the DOM element. 

  newCard(event) {
    const data = event.target.dataset
    fetch(`/bingo_cards`, {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "accept": "text/html"
      },
      body: JSON.stringify({
        "bingo_card": { 
          "bingo_game_id": data.gameId
        }
      })
  }).then(res => res.text())
      .then(html => this.appendToBingoCards(html));
  }
  
  appendToBingoCards(card_data) {
    this.appendBingoCardTarget.insertAdjacentHTML('beforeend', card_data);
  }

  removeAllCards() {
    this.destroyAllCall();
    this.removeAllBingoCardsTarget.innerHTML = "";
  }

  destroyAllCall() {
    fetch("/bingo_cards/destroy_all", {
      method: "DELETE"
    });
  }

}
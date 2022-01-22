import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["appendBingoCard", "removeAllBingoCards"]

  newCard() {
    fetch("/bingo_cards/new", {
      method: "GET",
      headers: {
        "accept": "text/html"
    }}).then(res => res.text())
      .then(html => this.appendToBingoCards(html));
  }

  removeAllCards() {
    this.destroyAllCall();
    this.removeAllBingoCardsTarget.innerHTML = "";
  }

  destroyAllCall() {
    fetch("/bingo_cards/destroy_all", {
      method: "DELETE"});
  }

  appendToBingoCards(card_data) {
    this.appendBingoCardTarget.insertAdjacentHTML('beforeend', card_data);
  }
}
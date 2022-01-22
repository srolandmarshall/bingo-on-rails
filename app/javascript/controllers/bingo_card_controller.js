import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["bingoCard"]

  click() {
    fetch("/bingo_cards/new", {
      method: "GET",
      headers: {
        "accept": "text/html"
    }}).then(res => res.text())
      .then(html => this.appendToBingoCards(html));
  }

  appendToBingoCards(card_data) {
    this.bingoCardTarget.insertAdjacentHTML('beforeend', card_data);
  }
}
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

  numberToLetter(num) {
    switch (true) {
      case (num <= 15): {
        return "B"
      }
      case (num <= 30): {
        return "I"
      }
      case (num <= 45): {
        return "N"
      }
      case (num <= 60): {
        return "G"
      }
      case (num <= 75): {
        return "O"
      }
      default: {
        break;
      }
    }
  }
}
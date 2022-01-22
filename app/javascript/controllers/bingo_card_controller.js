import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["bingoCard"]

  click() {
    console.log("Bingo Card Controller Clicked!")
    fetch("/bingo_cards/new", {
      method: "GET",
      headers: {
        "accept": "text/html"
    }}).then(res => res.text())
      .then(html => this.appendToBingoCards(html));
  }

  appendToBingoCards(card_data) {
    console.log("card data class", typeof card_data)
    var doc = new DOMParser().parseFromString(card_data, "text/html");
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
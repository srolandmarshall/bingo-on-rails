import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["bingoNumber"]

  click() {
    console.log("Bingo Card Controller Clicked!")
    fetch("/bingo_cards/new", {
      method: "GET",
      headers: {
        "content-type": "application/json",
        "accept": "application/json"
    }}).then(res => res.json())
      .then(data => this.appendToBingoCards(data));
  }

  appendToBingoCards(card_data) {
    console.log(card_data)
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
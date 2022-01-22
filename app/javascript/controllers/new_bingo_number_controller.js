import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["bingoNumber"]
  click(event) {
    fetch(`/bingo_games/${event.target.dataset.gameId}/draw_number`, {
      method: "POST",
      headers: {
        "accept": "text/plain"
      }
    }).then(res=> res.text())
    .then(data => this.bingoNumberTarget.textContent = data);
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
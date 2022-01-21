import { Controller } from "@hotwired/stimulus"
import { application } from "./application"

export default class extends Controller {
  
  static targets = ["bingoNumber"]

  click() {
    console.log("Clicked!")
    let num = Math.floor(Math.random() * (66-1)) + 1;
    let letter = this.numberToLetter(num)
    
    this.bingoNumberTarget.textContent = letter + num
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
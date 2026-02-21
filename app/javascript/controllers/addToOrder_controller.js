import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("addToOrder controller connected")
  }
  addOrder(event) {
    event.preventDefault();
        
  }
}
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-menu"
export default class extends Controller {
  connect() {
  }
  toggleMenu(event) {
    console.log('Hello World!')
  }
}

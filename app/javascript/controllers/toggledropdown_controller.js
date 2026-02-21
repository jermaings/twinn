import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "foodItems", "foodOptions" ] // Declare foodItems as a target

  toggle(event) {
    const clickedButton = event.target;
    const foodItemsContainer = clickedButton.nextElementSibling; // Get the next sibling element (the food items div)
    this.foodItemsTarget.classList.toggle("is-hidden") // Toggle the "is-hidden" class
  }

  toggleItem(event) {
    const clickedButton = event.target;
    const foodItemsContainer = clickedButton.nextElementSibling; // Get the next sibling element (the food items div)
    this.foodOptionsTarget.classList.toggle("is-hidden") // Toggle the "is-hidden" class
    this.element.classList.toggle(this.foodOptionClasses)// Toggle the CSS class on the controller's element

  }
  mouseEnter() {
    // this.element.classList.add("hovered-state") 
    // this.foodItemsTarget.classList.remove("is-hidden")
    // You can add logic here for what happens when the mouse enters
    console.log("Mouse entered the button") 
  }
  mouseLeave() {
      // this.element.classList.remove("hovered-state")
      // this.foodItemsTarget.classList.add("is-hidden")
      // You can add logic here for what happens when the mouse leaves
      console.log("Mouse left the button")
    }


}

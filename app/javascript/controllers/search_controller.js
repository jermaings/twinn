// app/javascript/controllers/search_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["query", "result"]
  
  // This action is called when the form is submitted
  search(event) {
    console.log('In The Search Controller!')
    event.preventDefault(); // Prevent the default form submission

    const query = this.queryTarget.value.toLowerCase();
    const results = this.resultTargets;
    let found = false;

    // Iterate through all "result" targets to find a match
    for (const result of results) {
      const resultText = result.textContent.toLowerCase();
      
      // If a match is found, scroll to it and highlight
      if (resultText.includes(query)) {
        this.scrollTo(result);
        result.classList.add("highlight");
        found = true;
        // break; // Stop after finding the first match
      }
    }

    if (!found) {
      alert("No matching content found.");
    }
  }

  // Action to remove highlighting when the input is changed
  clearHighlight() {
    this.resultTargets.forEach(result => {
      result.classList.remove("highlight");
    });
  }
  
  // Custom method to scroll smoothly to an element
  scrollTo(element) {
    element.scrollIntoView({
      behavior: "smooth",
      block: "center"
    });
  }
}

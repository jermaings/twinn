import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["query", "item"]

  perform(event) {
    event.preventDefault()
    console.log('hello')
    // 1. Grab and normalize the search term
    const term = this.queryTarget.value.trim().toLowerCase()
    if (term === "") return

    // 2. Clear any previous highlights
    this.itemTargets.forEach(el =>
      el.classList.remove("search-highlight")
    )

    // 3. Find first matching element
    const match = this.itemTargets.find(el =>
      el.textContent.toLowerCase().includes(term)
    )

    if (match) {
      // 4. Highlight it
      match.classList.add("search-highlight")

      // 5. Scroll it into view
      match.scrollIntoView({
        behavior: "smooth",
        block: "center"
      })
    } else {
      // Optional: user feedback
      alert(`No matches for “${this.queryTarget.value}”`)
    }
  }
}

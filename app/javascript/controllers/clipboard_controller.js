import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "message"]
  static classes = ["supported"]

  connect() {
    if ("clipboard" in navigator) {
      this.element.classList.add(this.supportedClass)
    }
  }

  async copy() {
    const textToCopy = this.sourceTarget.textContent || this.sourceTarget.value;

    try {
      await navigator.clipboard.writeText(textToCopy);
      this.showMessage();
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }

  showMessage() {
    if (this.hasMessageTarget) {
      this.messageTarget.classList.remove("hidden");
      setTimeout(() => {
        this.messageTarget.classList.add("hidden");
      }, 2000);
    }
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openreviewform"
export default class extends Controller {
  static targets = ["content"]

  revealContent() {
    this.contentTarget.classList.remove("d-none");
  }
}

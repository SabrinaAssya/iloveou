import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["card", "carousel"]
  connect() {
    console.log("hello from carousel controller stimulus");
    console.log(this.element);
    console.log(this.carouselTarget);
  }

  scroll() {
    console.log("coucou2")
    console.log(this.element.event)
  }
}

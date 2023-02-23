import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["card", "carousel"]
  connect() {
    console.log("hello from carousel controller stimulus");
    console.log(this.element);
    console.log(this.carouselTarget);
    console.log(this.cardTarget);
    console.log(this.element.clientWidth)

    const arrowIcons = this.element.querySelectorAll("i")
    const firstCard = this.carouselTarget.querySelectorAll("card-slider")[0];
    let firstCardWidth = firstCard.this.element.clientWidth + 50;
    arrowIcons.forEach(icon => {
      icon.addEventListener("click", () => {
        this.carouselTarget.scrollLeft += icon.id == "left" ? -firstCardWidth : firstCardWidth;
      })
    });
  }

  /* scroll() {
    const arrowIcons = this.element.querySelectorAll("i")
    arrowIcons.forEach(icon => {
      icon.addEventListener("click", () => {
        console.log(icon)
      })
    });

  } */
}

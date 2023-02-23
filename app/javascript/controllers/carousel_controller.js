import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = ["card", "carousel"]
  connect() {
    console.log("hello from carousel controller stimulus");
    console.log("lala")
  }

  left() {
    const firstCard = this.carouselTarget.querySelectorAll(".card-slider")[0];
    let firstCardWidth = firstCard.clientWidth + 50;
    this.carouselTarget.scrollLeft -= firstCardWidth
    const firstIcon = this.element.childNodes[1]
    const secondIcon = this.element.childNodes[5]
    console.log(this.carouselTarget.scrollLeft + "left")
    if(this.carouselTarget.scrollLeft <= 346) {
      firstIcon.setAttribute("style", "display: none;")
    }

    if(this.carouselTarget.scrollLeft >=346 ) {
      secondIcon.setAttribute("style", "display: inline-block;")
    }
  }

  right() {
    const firstCard = this.carouselTarget.querySelectorAll(".card-slider")[0];
    let firstCardWidth = firstCard.clientWidth + 50;
    this.carouselTarget.scrollLeft += firstCardWidth
    const secondIcon = this.element.childNodes[5]
    const firstIcon = this.element.childNodes[1]
    console.log(this.carouselTarget.scrollLeft + "right")
    if(this.carouselTarget.scrollLeft == 692) {
      secondIcon.setAttribute("style", "display: none;")
    }

    if(this.carouselTarget.scrollLeft === null) {
      firstIcon.setAttribute("style", "display: none;")
    } else {
      firstIcon.setAttribute("style", "display: inline-table;")
    }
  }
}

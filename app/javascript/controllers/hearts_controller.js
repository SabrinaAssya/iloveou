import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["heart", "rating"]

  connect() {
    console.log("hello");
  }

  rating(event) {
    const selectedHeart = event.currentTarget;
    const selectedRating = parseInt(selectedHeart.id);
    const hearts = this.heartTargets;

    hearts.forEach((heart, index) => {
      if (index < selectedRating) {
        heart.classList.add("active");
      } else {
        heart.classList.remove("active");
      }
    });
    this.ratingTarget.value = selectedRating
  }
}

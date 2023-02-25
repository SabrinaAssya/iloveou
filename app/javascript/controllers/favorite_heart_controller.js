import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite-heart"
export default class extends Controller {
  static targets = ["fav"]

  updateFav() {
    let id = ""
    id = this.favTarget.dataset.fav
    const data = new FormData()
    data.append(`favorite[itinerary_id]`, this.favTarget.dataset.itinerary)
    data.append(`favorite[user_id]`, this.favTarget.dataset.user)

    if (this.favTarget.classList.contains("far")) {
      this.createFav(data)
    } else {
      this.deleteFav(data, id)
    }

  }

  createFav(data) {
    fetch(`itineraries/${this.favTarget.dataset.itinerary}/favorites`, {
      method: "POST",
      headers: { "Accept": "application/json",
      "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content
    },
      body: data
    })
      .then(response => response.json())
      .then((data) => {
        this.favTarget.classList.replace("far", "fa-solid")
      })

  }

  deleteFav(data, id) {
    fetch(`/favorites/${id}`, {
      method: "DELETE",
      headers: { "Accept": "application/json",
      "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content
    },
      body: data
    })
      .then(response => response.json())
      .then((data) => {
        this.favTarget.classList.replace("fa-solid", "far")
      })
  }
}

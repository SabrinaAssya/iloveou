// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { dynamicRating } from "../plugins/starsInReviewForm";

document.addEventListener('turbolinks:load', () => {
  // [...]
  dynamicRating();
})

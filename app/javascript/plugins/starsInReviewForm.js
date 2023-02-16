const toggleColorStars = (stars, rating) => {
  stars.forEach((star) => {
    if (star.id <= rating) {
      star.className = "review-rating fas fa-star"
    } else {
      star.className = "review-rating far fa-star"
    }
  });
};

const updateRatingInputForm = (rating) => {
  const formInput = document.getElementById('review_rating')
  formInput.value = rating
}

const dynamicRating = () => {
  const stars = document.querySelectorAll('.review-rating');
  const starsReview = document.querySelector('#review-star-ratings');


  if ( stars.length > 0) {
    stars.forEach((star) => {
      // au clic je récupère la valeur du rating, j'applique le style css et j'ajoute une classe "selected" sur l'étoile
      star.addEventListener("click", (event) => {
        const rating = event.currentTarget.id
        updateRatingInputForm(rating);
        toggleColorStars(stars, rating);
        star.classList.add("selected")
      });
      star.addEventListener("mouseover", (event) => {
        const rating = event.currentTarget.id
        if (!(document.querySelector(".selected"))) {
          toggleColorStars(stars, rating);
        }
      });
    });
    starsReview.addEventListener("mouseout", (event) => {
      if (!(document.querySelector(".selected"))) {
        stars.forEach((star) => {
          star.className = "review-rating far fa-star"
        });
      }
    });
  };
};

export { dynamicRating };

Rails.application.routes.draw do
  get 'stimulus/search_station'
  devise_for :users
  root to: "pages#home"
  resources :itineraries do
    resources :activities
    resources :reviews
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

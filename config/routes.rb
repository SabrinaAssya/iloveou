Rails.application.routes.draw do
  get 'stimulus/search_station'
  devise_for :users
  root to: "pages#home"
  resources :itineraries do
    resources :activities, only: [:new, :create, :index]
    resources :reviews
  end
  resources :activities, except: [:new, :create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

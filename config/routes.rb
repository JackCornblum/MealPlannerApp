Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]
  resources :recipes, only: [:create, :destroy]
  resources :ingredients, only: [:create]

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/me", to: "sessions#show"
  get "/my_recipes", to: "users#recipes"
  get "/my_ingredients", to: 'users#ingredients'
end

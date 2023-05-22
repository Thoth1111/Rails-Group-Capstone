Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "users#index"

  resources :recipe_foods
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

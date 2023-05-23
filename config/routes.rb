Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root 'foods#index'

  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :users

  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'foods#general_shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end

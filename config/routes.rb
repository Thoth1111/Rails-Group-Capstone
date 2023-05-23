Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "users#index"

  resources :recipe_foods
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      patch :toggle_public
    end
  end
  resources :foods
  resources :users

  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'foods#general_shopping_list'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

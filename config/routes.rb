Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  post '/recipes/friend_recipe' => "recipes#friend_recipe"
  resources :recipes
  resources :cuisines
  resources :food_types
  resources :food_preferences

  get '/users/:id' => "users#show"

  root 'home#index'

  post '/recipes/:id/favorites' => "recipes#favorites"
  #just to avoid colisions
  get  '/recipes/:id/favorites' => "recipes#show"
  get  '/recipes/:category/:id' => "recipes#categories"
end

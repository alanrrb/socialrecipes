Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resources :recipes
  resources :cuisines
  resources :food_types
  resources :food_preferences

  root 'home#index'
end

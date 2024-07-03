# config/routes.rb
Rails.application.routes.draw do
  get 'held_items/index'
  get 'held_items/show'

  resources :held_items  # This sets up RESTful routes for items
  root 'pokemon#index'
  get 'pokemon/:id', to: 'pokemon#show', as: 'pokemon_show'
end
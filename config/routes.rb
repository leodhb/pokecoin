Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/pokemon', to: 'pokemon#index', as: 'pokemon_index'
  get '/pokemon/:id', to: 'pokemon#show', as: 'pokemon_show'
  get '/pokemon/:id/checkout', to: 'pokemon#checkout', as: 'pokemon_checkout'
  post '/pokemon/:id/buy', to: 'pokemon#buy', as: 'pokemon_buy'
  post '/pokemon/:id/sell', to: 'pokemon#sell', as: 'pokemon_sell'

  get '/me', to: 'user#index', as: 'user_index'
  get '/me/add', to: 'user#add', as: 'user_add'
  get '/me/transactions', to: 'user#transactions', as: 'user_transactions'
  patch '/me/add', to: 'user#store_money', as: 'user_store_money'
end

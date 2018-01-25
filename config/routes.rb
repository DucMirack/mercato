Rails.application.routes.draw do
  get '/players/free', to: "players#free"
  get '/players/not-free', to: "players#not_free"
  get '/users/:id/players', to: "users#get_players"
  get '/round', to: "users#get_current_round"
  get '/close-round', to: "bids#close_round"
  resources :bids
  resources :players
  resources :users
  post '/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

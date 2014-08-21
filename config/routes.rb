Rails.application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  root to: 'home#index'
  resources :users
  resources :matches

end

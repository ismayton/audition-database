Rails.application.routes.draw do
  
  root to: 'sessions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#delete'

  resources :orchestras
  resources :positions
  resources :lists
  resources :users
  resources :excerpts
  resources :composers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

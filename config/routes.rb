Rails.application.routes.draw do
  
  root to: 'sessions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#delete'

  resources :orchestras, :positions, :lists, :excerpts, :composers
  resources :users, only: [:new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

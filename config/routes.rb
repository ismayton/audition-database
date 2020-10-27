Rails.application.routes.draw do
  
  root to: 'sessions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#delete'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/library', to: 'sessions#library'

  resources :orchestras, :positions, :excerpts, :composers, :pieces, :instruments
  
  resources :instruments do 
    resources :lists, only: [:index]
  end 
  
  resources :users, only: [:new, :create] do
    resources :lists, only: [:index, :new]
  end 

  resources :lists do 
    resources :excerpts, only: [:index, :new]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

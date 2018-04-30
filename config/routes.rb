Rails.application.routes.draw do
  get '/', to: 'application#home'
  get '/search', to: 'movies#search'
  get '/default', to: 'movies#default'
  post '/login', to: 'auth#create'
  post '/logout', to: 'auth#destroy'
  resources :movies, only: [:index, :create]
  resources :lists
  resources :users, only: [:create, :show]
  resources :movie_lists


end

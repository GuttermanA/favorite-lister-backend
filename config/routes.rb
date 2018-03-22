Rails.application.routes.draw do
  resources :movies, only: [:index]
  resources :lists
  resources :users, only: [:create, :show]
  resources :list_movie_users

  get '/search', to: 'movies#search'
end

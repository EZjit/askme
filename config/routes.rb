Rails.application.routes.draw do

  root to: 'questions#index'
  
  post '/session', to: 'sessions#create'
  get '/session/new', to: 'sessions#new'
  delete '/session', to: 'sessions#destroy'
  
  resources :questions

  resources :users, only: %i[new create]
end
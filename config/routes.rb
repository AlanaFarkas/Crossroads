Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  resources :favorites, only: [:index]
  resources :establishments, only: [:show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'home#index'
  
end

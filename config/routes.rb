Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :favorites, only: [:index]
  resources :establishments, only: [:show]

  devise_scope :user do
    # get '/login' => 'sessions#new'
    # post '/login' => 'sessions#create'
    # get '/logout' => 'sessions#destroy'
    root to: '/index'
  end
end

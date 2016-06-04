Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show]
  resources :favorites, only: [:index]
  resources :establishments, only: [:show]
  resources :search , only: [:new, :show]

  devise_scope :user do
    # get '/login' => 'sessions#new'
    # post '/login' => 'sessions#create'
    get "/login" => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  root to: "home#index"
end

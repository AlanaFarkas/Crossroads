Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: "home#index"

  resources :addresses, except: [:index, :show]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :edit, :update]
  resources :favorites, only: [:index, :destroy]
  resources :establishments, only: [:show]

  get "/search/show"   => "search#show", as: :search_show
  # get '/users/favorites' => 'users#favorites'

  devise_scope :user do

    get "/login" => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

end

Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
  resources :establishments, only: [:show]

  get "/search"   => "search#new", as: :search
  post "/search"  => "search#create"
  get "/search/show"   => "search#show", as: :search_show
  
  devise_scope :user do

    get "/login" => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

end

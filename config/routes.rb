Rails.application.routes.draw do
  
  resources :posts do 
    resources :comments
  end
  resources :comments

  root 'logged_out#home'
  
  get "/dashboard" => "logged_in#home"  

  get "/search" => "search#index"
  get "/search" => "search#index"

  resources :cities
  resources :cohorts
  resources :companies

  resources :users

  get "/auth/:provider/callback" => "sessions#create", as: :login
  get "/logout" => "sessions#destroy", :as => :logout


end

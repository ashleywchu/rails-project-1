Rails.application.routes.draw do
  
  get '/posts', to: redirect('/dashboard')
  resources :posts do 
    resources :comments
  end

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

  get "unverified" => "unverified#index"
  get "/users/verifyuser" => "users#verify"

end

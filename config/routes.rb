Rails.application.routes.draw do

  get 'session/new'

  get 'user/new'
  root :to => "main#index"

  get "log_out" => "session#destroy", :as => "log_out"
  get "log_in" => "session#new", :as => "log_in"

  resources :user
  resources :session
end

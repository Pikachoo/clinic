Rails.application.routes.draw do

  get 'session/new'

  get 'user/new'
  root :to => "main#index"

  get "log_out" => "session#destroy", :as => "log_out"
  get "log_in" => "session#new", :as => "log_in"

  resources :user
  resources :session

  namespace :api, defaults: {format: :json} do
    resources :cards do
      resources :medical_speciality, only: [] do
        resources :card_records, only: [:index]
      end
    end
    resources :card_records
  end

  namespace :external_entry do
    resource :patient, only: [:show] do
      resource :card, only: [:show] do
        resources :medical_speciality do
          resources :records
        end
      end
    end
  end


  namespace :internal_entry  do
    resource :doctor, only: [:show] do
        resources :receptions , only: [:show, :index, :new, :create]
        resource :card_record
    end
    resources :cards
  end




end

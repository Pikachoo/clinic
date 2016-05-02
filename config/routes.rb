Rails.application.routes.draw do

  get 'session/new'

  get 'user/new'
  root :to => "main#index"

  get "log_out" => "session#destroy", :as => "log_out"
  get "log_in" => "session#new", :as => "log_in"

  resources :user
  resources :session

  resource :patient
  resource :card
  resources :card_record

  namespace :patient_card do
    resources :medical_speciality do
      resources :card_records
    end
  end
  get 'show_timetable' => 'doctor#show_timetable'
  get 'get_form_unplanned_patient' => 'doctor#get_form_unplanned_patient'


  namespace :api, defaults: { format: :json }  do
    resources :cards do
      resources :medical_speciality, only: [] do
        resources :card_records, only: [:index]
      end
    end
    resources :card_records
  end
end

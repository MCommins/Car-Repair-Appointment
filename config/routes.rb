Rails.application.routes.draw do
  resources :appointments
  resources :appointment_activations, only: [:edit]
  root to: "appointments#index"
end

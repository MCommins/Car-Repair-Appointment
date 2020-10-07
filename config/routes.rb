Rails.application.routes.draw do
  resources :appointments
  root to: "appointments#index"
end

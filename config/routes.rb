Rails.application.routes.draw do
	Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  resources :appointments
  resources :appointment_activations, only: [:edit]
  root to: "appointments#index"
end

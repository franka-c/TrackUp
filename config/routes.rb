Rails.application.routes.draw do
  devise_for :users, skip: [ :registrations ], controllers: {
    sessions: "devise/sessions"
  }
  root "participants#new"  # Show the sign-up form on the homepage
  resources :participants, only: [ :new, :create, :index, :destroy ] do
    collection do
      get :thank_you
      get :export
    end
    patch :toggle_payment, on: :member
  end

  match "/404", to: "errors#not_found", via: :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

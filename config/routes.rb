Rails.application.routes.draw do
  get "faqs", to: 'faqs#index', as: 'faqs'
  devise_for :users
  devise_for :installs
  resources :food_types
  resources :orders
  resources :condiment_amts
  resources :food_items
  resources :condiments
  resources :item_sizes
  resources :foods
  root "home#index"
  post "foods/index"
  get "sections/sections" => "foods#toggelling"
  get "food_items/processing"
  get "social_media" => "food_types#social"
  post "processing" => "food_items#processing"
  get "users/sign_in" => "devise/session#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
  get 'sign_in', to: 'devise/sessions#new'
  get 'sign_up', to: 'devise/registrations#new'
  get 'sign_out', to: 'devise/sessions#destroy'
end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

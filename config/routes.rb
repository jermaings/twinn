Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Root route
  root "discussions#index"

  # RESTful routes for discussions, topics, and social media posts
  resources :discussions do
    resources :topics, except: [:index] do
      resources :social_media_posts, except: [:index]
      member do
        post :post_to_social_media
      end
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

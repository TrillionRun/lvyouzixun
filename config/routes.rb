Rails.application.routes.draw do
  devise_for :services
  root to: "customer_service/home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  namespace :customer_service do
    get 'users' => 'user#index'
    get 'users/:user_id' => 'user#show'
    get 'users/:user_id/edit' => 'user#edit'
    get 'businesses' => 'business#index'
  end

  namespace :api do
    resources :users, only: [:show, :update, :create]
    resources :sessions, only: [:create]
    resources :advertisements, only: [:show]


    # appointments
    get 'users/:user_id/appointments' => 'appointments#index'
    post 'users/:user_id/appointments' => 'appointments#create'
    patch 'users/:user_id/appointments/:id' => 'appointments#update'

    # businesses
    get 'businesses/:id' => 'businesses#show'

    # follows
    get 'users/:user_id/follows' => 'follows#index'
    post 'users/:user_id/follows' => 'follows#create'
    patch 'users/:user_id/follows/:id' => 'follows#update'

    # information
    get 'businesses/:business_id/informations' => 'informations#show'

    # itineraries
    get 'businesses/:business_id/itineraries' => 'itineraries#index'
    get 'businesses/:business_id/itineraries/:itinerary_id' => 'itineraries#show'

    # news
    get 'businesses/:business_id/news' => 'news#index'
    get 'businesses/:business_id/news/:news_id' => 'news#show'

    # company_types
    get 'company_types' => 'company_types#index'
  end
end

Rails.application.routes.draw do
  devise_for :services
  root to: "customer_service/home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  namespace :customer_service do
    resources :user
    resources :business do
      resources :itinerary do
        resources :daily_plan
      end

      post 'post_detail', on: :member
    end
    resources :petition
    resources :appointment
    # resources :advertisement
  end

  namespace :public do
    get 'business/:business_id/itinerary/:itinerary_id' => 'itinerary#show'
  end

  namespace :api do
    resources :users, only: [:show, :update, :create]
    resources :sessions, only: [:create]
    resources :advertisements, only: [:show]

    # logout
    patch 'users/:user_id/logout' => 'sessions#destroy'

    # update password
    patch 'users/:user_id/update_password' => 'users#update_password'

    # check follow
    get 'users/:user_id/business/:business_id/check' => 'users#business_user'
    delete 'users/:user_id/business/:business_id/uncheck' => 'users#business_user'

    # appointments
    get 'users/:user_id/appointments' => 'appointments#index'
    post 'users/:user_id/appointments' => 'appointments#create'
    patch 'users/:user_id/appointments/:id' => 'appointments#update'

    # businesses
    get 'businesses/:id' => 'businesses#show'
    get 'businesses' => 'businesses#index'

    # follows
    get 'users/:user_id/follows' => 'follows#index'
    post 'users/:user_id/follows' => 'follows#create'
    patch 'users/:user_id/follows/:id' => 'follows#update'
    delete 'users/:user_id/follow/:id' => 'follows#destroy'

    # information
    get 'businesses/:business_id/informations' => 'informations#index'
    get 'businesses/:business_id/informations/:id' => 'informations#show'

    # itineraries
    get 'businesses/:business_id/itineraries' => 'itineraries#index'
    get 'businesses/:business_id/itineraries/:id' => 'itineraries#show'

    # advertisements
    get 'advertisements' => 'advertisements#index'

    # company_types
    get 'company_types' => 'company_types#index'
  end
end

Rails.application.routes.draw do
  devise_for :services
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  root to: "customer_service/home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  resources :users, :concerns => :paginatable

  namespace :customer_service do
    resources :user, :concerns => :paginatable do
      get 'follows' => :user_follows, on: :member
    end
    resources :business, :concerns => :paginatable do
      resources :itinerary do
        resources :daily_plan
      end
      resources :chats do
        get 'messages' => :show_messages, on: :collection
      end
      post 'post_detail', on: :member
    end
    resources :petition, :concerns => :paginatable
    resources :appointment, :concerns => :paginatable
    resources :advertisement

  end

  namespace :public do
    get 'business/:business_id/itinerary/:itinerary_id' => 'itinerary#show'
    get 'terms' => 'terms#index'
  end

  namespace :api do
    # forget password
    post 'users/update_forgotten_password_code' => 'users#code_before_forget_password'
    patch 'users/update_forgotten_password' => 'users#update_forgotten_password'

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

    # upload picture
    patch 'users/:user_id/upload_pricture' => 'users#upload_picture'

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
    delete 'users/:user_id/follows' => 'follows#destroy'

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

    # conversation
    post 'users/:user_id/businesses/:business_id/talk' => 'messages#create'
    get 'users/:user_id/businesses/:business_id/conversation' => 'conversations#show'
    get 'users/:user_id/conversations' => 'conversations#index'

    # petitions
    post 'users/:user_id/petitions' => 'petitions#create'
    get 'users/:user_id/petitions' => 'petitions#index'

    # code
    post 'register_code' => 'users#code_before_create'

  end
end

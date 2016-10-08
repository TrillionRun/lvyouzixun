Rails.application.routes.draw do
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :admin do
      namespace :v1 do
       resources :users, only: [:show, :update]
       resources :sessions, only: [:create]
     end
    end
  end
end

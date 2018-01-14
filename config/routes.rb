Rails.application.routes.draw do

  root 'events#index'

  resources :events, except: [:index] do
      resources :comments, only: [:create, :destroy]
  end
  post 'events/add_guest'
  post 'events/remove_guest'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [:index, :show] do
      resources :friend_requests, only: [:index, :create, :update]
      resources :friends, only: [:index, :destroy]
  end
  get 'users/:id/createdevents', to: 'users#created_events', as: 'created_events'
  
   # API
   namespace :api, path: "",
                   constraints: { subdomain: "api" },
                   defaults: {format: :json} do
     namespace :v1 do
       resources :events
     end
   end

 end
Rails.application.routes.draw do

  root 'events#index'

  resources :events, except: [:index]
  post 'events/add_guest'
  post 'events/remove_guest'

  devise_for :users

   # API
   namespace :api, path: "",
                   constraints: { subdomain: "api" },
                   defaults: {format: :json} do
     namespace :v1 do
       resources :events
     end
   end

 end

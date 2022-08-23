Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  namespace :api do
    resources :users, only: %i[create index]
    get 'user', action: :showUser, controller: :users
    resources :product
    resources :order
    resources :bookmarks
    resources :status
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
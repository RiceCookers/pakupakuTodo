Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :token_info
  end
  use_doorkeeper scope: "admin"

  root 'tasks#index'
  resources :users, only: %i(new create)
  resources :tasks, only: %i(new create update)

  namespace :admin, module: :admin do
    root "home#index"
    resources :sessions, only: %i(new create)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'tasks#index'
  resources :users, only: %i(new create)
  resources :tasks, only: %i(new create update)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

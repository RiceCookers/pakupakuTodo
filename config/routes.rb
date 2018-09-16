Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      if Rails.env.development?
          mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/api/v1/graphql"
      end
      post "/graphql", to: "graphql#execute"
    end
  end

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
end

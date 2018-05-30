Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      get "/game/:id", to: "game#show"
      namespace :games do
        post ":id/plays", to: "plays#create"
      end
    end
  end
end

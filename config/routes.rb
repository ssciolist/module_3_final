Rails.application.routes.draw do
  root "welcome#index"

  namespace :api do
    namespace :v1 do
      get "/game/:id", to: "game#show"
    end
  end
end

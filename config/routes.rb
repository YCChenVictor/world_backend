Rails.application.routes.draw do
  resources :users
  resources :posts
  post "/login", to: "sessions#login"
  post "/sign_up", to: "sessions#signup"
end

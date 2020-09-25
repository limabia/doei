Rails.application.routes.draw do
  resources :produtos, only: [:new, :create, :destroy, :edit]
  resources :usuarios
  get "/produtos", to:"produtos#index"
  get "/login", to:"login#login"
  get "/", to:"home#index"
  root to:"home#index"
end

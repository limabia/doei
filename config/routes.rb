Rails.application.routes.draw do
  resources :produtos 
  resources :usuarios
  get "/", to:"home#index"
  get "/login", to:"login#login"
end

Rails.application.routes.draw do
  resources :produtos 
  get "/", to:"home#index"
end

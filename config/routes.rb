Rails.application.routes.draw do
  resources :produtos 
  get "/", to:"default#index"
end

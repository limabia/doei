Rails.application.routes.draw do
  get "/", to:"default#index"
  resources :produtos
end

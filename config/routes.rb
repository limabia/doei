Rails.application.routes.draw do
  resources :usuarios
  get "/", to:"default#index"
end

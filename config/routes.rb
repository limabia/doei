Rails.application.routes.draw do
  get "/", to:"home#index"
  get "/login", to:"login#login"
end

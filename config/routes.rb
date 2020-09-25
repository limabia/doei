Rails.application.routes.draw do
  resources :produtos, only: [:new, :create, :destroy, :edit]
  resources :usuarios
  get "/produtos", to:"produtos#index"
  get "produtos/busca", to:"produtos#busca", as: :busca_produto
  get "/login", to:"login#login"
  root to:"home#index"
end

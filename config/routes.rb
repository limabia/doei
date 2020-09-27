Rails.application.routes.draw do
  resources :usuarios, only: [:new, :create]
  resources :produtos, only: [:new, :create, :destroy, :edit]
  get 'entrar', to: 'sessoes#new'
  post 'entrar', to: 'sessoes#create'
  get 'home', to: 'sessoes#welcome'
  get 'sair', to: 'sessoes#destroy'
  get 'cadastrar', to: 'usuarios#new'
  get 'authorized', to: 'sessoes#page_requires_login'
  root to:"home#index"
end
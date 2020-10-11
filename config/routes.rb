Rails.application.routes.draw do
  resources :usuarios
  resources :produtos, only: [:new, :create, :destroy, :edit]
  get 'entrar', to: 'sessoes#new'
  post 'entrar', to: 'sessoes#create'
  get 'home', to: 'sessoes#welcome'
  get 'sair', to: 'sessoes#destroy'
  get 'cadastrar', to: 'usuarios#new'
  get 'produtos/cadastrar', to: 'produtos#new'
  get 'sessoes/busca', to: 'sessoes#busca', as: :buscar_produto
  get 'produtos', to: 'produtos#index'
  get 'authorized', to: 'sessoes#page_requires_login'
  get '/', to:"home#index"
end
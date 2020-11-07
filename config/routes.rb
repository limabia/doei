Rails.application.routes.draw do
  resources :categoria
  resources :usuarios  
  resources :feedbacks
  resources :produtos, only: [:new, :create, :destroy, :edit, :show, :update]
  post 'produtos/:id', to: 'produtos#show'
  root 'home#index'
  get 'entrar', to: 'sessoes#new'
  post 'entrar', to: 'sessoes#create'
  get 'reativacao_solicitacao', to: 'usuarios#reativacao_solicitacao'
  post 'reativacao_efetivacao', to: 'usuarios#reativacao_efetivacao'
  get 'sair', to: 'sessoes#destroy'
  get 'cadastrar', to: 'usuarios#new'
  get 'perfil', to: 'usuarios#edit'
  get 'produtos/cadastrar', to: 'produtos#new'
  get 'sessoes/busca', to: 'sessoes#busca', as: :buscar_produto
  post 'sessoes/busca', to: 'sessoes#busca'
  get 'produtos', to: 'produtos#index'
  get 'authorized', to: 'sessoes#page_requires_login'
  get '/', to:"home#index"
  get '/meus_produtos', to:"produtos#meus_produtos"
  post '/usuarios/admin/:id/adicionar', to: 'usuarios#adicionar_admin'
  post '/usuarios/admin/:id/remover', to: 'usuarios#remover_admin'
  get 'home', to:"home#index"
  get '/avaliacoes', to:"feedbacks#avaliacoes"
end
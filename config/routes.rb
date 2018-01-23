Rails.application.routes.draw do
  root to: "usuarios#index"
  
  #usuarios controller 
  get 'usuarios/novo', to: "usuarios#new", as: :new_usuario
  post 'usuarios/novo', to: "usuarios#create"
  get 'usuarios/edit/:id', to:"usuarios#edit", as: :edit_usuario
  patch 'usuarios/edit/:id', to:"usuarios#update"
  # ao se utilizar rotas que pussuem parametros, coloca-las por ultimo
  # se nao o rails vai confundir  o nome da rota com um paramentro
  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario
  delete 'usuarios/id', to: "usuarios#destroy", as: :destroy_usuario
  get 'usuarios', to: "usuarios#index", as: :index_usuarios

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

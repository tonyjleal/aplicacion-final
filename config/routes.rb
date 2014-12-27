Rails.application.routes.draw do
  get 'perfil/index'
  get 'perfil/show'
  get 'perfil/update'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :perfil, :only => [:index, :show, :update]
end

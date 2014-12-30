Rails.application.routes.draw do
  get 'perfil/index'
  get 'perfil/show'
  get 'perfil/update'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :perfil, :only => [:index, :show, :update]

  get 'nombre/:nombre' => 'users#show'
  get "contacto/:id" => 'users#contacto'
  post "contacto/:id" => 'users#contacto'
end

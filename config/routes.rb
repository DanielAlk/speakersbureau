Rails.application.routes.draw do

  root 'home#index'

  get 'admin' => 'admins#index'
  get 'admin/list' => 'admins#list'
  match 'admin' => 'admins#destroy', via: :delete
  devise_for :admins, controllers: { 
    registrations: 'admins/registrations', 
    sessions: 'admins/sessions', 
    passwords: 'admins/passwords'
  }

  resources :posts, path: 'blog'
  resources :speakers
  resources :speaker_images, only: :destroy
  resources :areas do
    collection do
      get 'empty'
    end
  end
  get 'contacto(/:speaker_id)' => 'contacts#new', as: :new_contact
  resources :contacts, path: 'contactos'

  match '*not_found', :to => 'application#routing_error', via: :all
  
end
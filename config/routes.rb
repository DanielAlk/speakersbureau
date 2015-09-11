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
  resources :areas do
    collection do
      get 'empty'
    end
  end
  get 'contacto' => 'contacts#new', as: :new_contact
  resources :contacts, path: 'contactos'
  
  get 'tb-asociados' => 'static_pages#brand', as: :brand

end
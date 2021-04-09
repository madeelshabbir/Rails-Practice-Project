Rails.application.routes.draw do
  root 'persons#index'
  devise_for :users, path_names: { sign_up: 'register' }
  #get '/persons/:id', to: 'persons#show', as: 'persons'
  # resources :persons do
  #   resources :addresses
  # end
  # resource :persons
  resources :persons do
    resources :addresses
    # member do
    #   get 'preview'
    # end
    # collection do
    #   get 'review'
    # end
    # get 'preview', on: :member
    # get 'review'photos, on: :collection
    # get 'view', on: :new
    # get 'addresses/:id', to: 'addresses#show', defaults: { format: 'jpg' }
    # defaults format: :json do
    #   get 'preview', on: :member
    # end
    # get 'addresses/:id', to: 'addresses#show', as: :addr
    # match 'addresses', to: 'addresses#show', via: :all
    # match 'addresses', to: 'addresses#show', via: [:get, :post]
    # get 'addresses/:id', to: 'addresses#show', constraints: { id: /\d+/ }
    # get 'photos/:id', to: 'photos#show', id: /[A-Z]\d{5}/
    # get 'addresses/:id', to: 'addresses#show', constraints: { subdomain: 'admin' }
    # get '/adeel', to: redirect('/persons')
    # get '/adeel/:id', to: redirect('/persons/%{id}', status: 302)
  end

  # resources :persons, as: 'men'
  # resources :persons, path_names: { new: 'make', edit: 'change' }

  # direct :homepage do
  #   "http://www.rubyonrails.org"
  # end

  # scope shallow_path: 'shallow', shallow_prefix: 'shallow' do
  #   resources :persons do
  #     resources :addresses, shallow: true
  #   end
  # end


  # scope 'admin', as: 'admin' do
  #   resources :persons, :addresses
  # end

  # namespace 'admin' do
  #   resources :persons, :addresses
  # end

  # resources :persons, :addresses

  # scope(path_names: { new: 'neu', edit: 'bearbeiten' }) do
  #   resources :persons, path: 'kategorien'
  # end

  #resources :persons, param: :identifier

  # concern :addressable do
  #   resources :addresses
  # end

  # resources :persons, concerns: :addressable
end

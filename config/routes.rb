Rails.application.routes.draw do
  root 'persons#index'
  devise_for :users, path_names: { sign_up: 'register' }
  #get '/persons/:id', to: 'persons#show', as: 'persons'
  # resources :persons do
  #   resources :addresses
  # end
  # scope shallow_path: 'shallow', shallow_prefix: 'shallow' do
  #   resources :persons do
  #     resources :addresses, shallow: true
  #   end
  # end
  concern :addressable do
    resources :addresses
  end
  resources :persons, concerns: :addressable
end

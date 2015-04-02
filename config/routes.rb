Rails.application.routes.draw do
  root to: 'contacts#index'

  resources :messages, except: ['show', 'edit', 'update']

  resources :contacts
end

# Rails.application.routes.draw do
#   devise_for :users
#   resources :recruits
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   root "recruits#index"
# end

# frozen_string_literal: true

Rails.application.routes.draw do

  root 'recruits#index'
  get 'recruits/edit', to: 'recruits#edit'
  delete 'recruits/delete', to: 'recruits#destroy'
  get 'recruits/update', to: 'recruits#update'
  resources :recruits
  

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :recruits, only: [:new, :create, :edit, :destroy, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

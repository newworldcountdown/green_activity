# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:show]
  get 'users/:id/amount_change_success', to: 'users#amount_change_success', as: 'user_amount_change_success'
  get 'users/:id/amount_change_failed', to: 'users#amount_change_failed', as: 'user_amount_change_failed'
  resource :bags, only: %i[new create]
  resource :movements, only: %i[new create show]
  get 'movements/destroy'
  get 'movements/success'
  get 'movements/failed'
  # get 'bags/new'
  # post 'bags/result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

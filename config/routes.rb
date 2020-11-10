# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  resources :users, only: %i[show edit update]
  get 'users/:id/amount_change_success', to: 'users#amount_change_success', as: 'user_amount_change_success'
  get 'users/:id/amount_change_failed', to: 'users#amount_change_failed', as: 'user_amount_change_failed'
  resource :bags, only: %i[new create]
  resource :movements, only: %i[new create show]
  get 'movements/destroy'
  get 'movements/success'
  get 'movements/failed'
end

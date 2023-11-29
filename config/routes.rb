# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :users do
    resources :categories, only: [:index, :show, :new, :create]
    resources :expenses, only: [:new, :create]
  end
end

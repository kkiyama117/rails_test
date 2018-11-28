# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'home', to: 'home#index', as: 'user_root'
  root 'welcome#index'
end

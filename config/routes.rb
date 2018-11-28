# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'home#index', as: 'user_root'
  root 'welcome#index'
end

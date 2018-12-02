# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # user_root_path
  get '/auth/:action/callback', controller: 'authentications', constraints: { action: /facebook/ }

  # user root
  get 'users', action: :show, controller: :users, as: :user_root
  root 'welcome#index'
end

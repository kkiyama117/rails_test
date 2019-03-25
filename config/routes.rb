# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: 'users/registrations',
    # passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # user root
  get 'users', action: :show, controller: :users, as: :user_root
  root 'welcome#index'
end

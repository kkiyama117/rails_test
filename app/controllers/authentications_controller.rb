# frozen_string_literal: true

# Auth controller
class AuthenticationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    auth = request.env['omniauth.auth']
    unless Authentication.find_user_by auth
      Authentication.create_with_auth_data(auth, user: current_user)
    end
    redirect_to root_url
  end

  def destroy
    provider = params[:provider]
    auth = Authentication.find_by(provider: provider, user: current_user)
    auth.destroy
    redirect_to root_url
  end
end

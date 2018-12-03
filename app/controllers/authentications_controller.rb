# frozen_string_literal: true

# Auth controller
class AuthenticationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    auth = request.env['omniauth.auth']
    Authentication.create_with_auth_data(auth, user: current_user)
    redirect_to root_url
  end

  def destroy
    provider = params[:provider]
    auth = Auth.find_by_provider_and_user_id(provider, current_user.id)
    auth.destroy
    redirect_to root_url
  end
end

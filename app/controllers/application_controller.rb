class ApplicationController < ActionController::Base
  def authenticate_user!
    redirect_to user_facebook_omniauth_authorize_path(:facebook) unless user_signed_in?
    super
  end
end

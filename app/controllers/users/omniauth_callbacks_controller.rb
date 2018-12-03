# frozen_string_literal: true

# omniauth controller for user
module Users
  # omniauth
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    def facebook
      base_action
    end

    # https://github.com/plataformatec/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end

    private

    def base_action
      auth = request.env['omniauth.auth']
      profile = Authentication.find_by(provider: auth.provider, uid: auth.uid)
      if profile.user.persisted?
        # this will throw if @user is not activated
        sign_in_and_redirect @user, event: :authentication
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: auth.provider)
        end
      else
        session["devise.#{auth.provider}_data"] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
  end
end

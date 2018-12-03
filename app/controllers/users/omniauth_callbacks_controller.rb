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
      user = User.find_by_auth(auth)
      if user.present?
        sign_in_and_redirect user, event: :authentication
        set_flash_message(:notice, :success, kind: auth.provider) if is_navigational_format?
      elsif current_user.present?
        auth_data = OmniauthParamsBuilder.new(model_name: 'Authentication', auth: auth).run
        auth_data.update(user_id: current_user.id)
        Authentication.create(auth_data)
        redirect_to user_root_path
      else
        session['devise.user_attributes'] = auth
        redirect_to new_user_registration_path
      end
    end
  end
end

# frozen_string_literal: true

# omniauth controller for user
module Users
  # omniauth
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
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
      user = User.find_by_auth(auth).first
      if user_signed_in?
        if user.present?
          reason = if user == current_user
                     '既にログインしています'
                   else
                     'そのアカウントは別のUserによって登録されています'
                   end
          set_flash_message(:notice, :failure, kind: auth.provider, reason: reason) if is_navigational_format?
          redirect_to user_root_path
        else
          auth_data = OmniauthParamsBuilder.new(model_name: 'Authentication', auth: auth).run
          current_user.authentications.create(auth_data)
          set_flash_message(:notice, :success, kind: auth.provider) if is_navigational_format?
          redirect_to user_root_path
        end
      elsif user.present?
        sign_in_and_redirect user, event: :authentication
        set_flash_message(:notice, :success, kind: auth.provider) if is_navigational_format?
      else
        session['devise.user_attributes'] = auth
        redirect_to new_user_registration_path
      end
    end
  end
end

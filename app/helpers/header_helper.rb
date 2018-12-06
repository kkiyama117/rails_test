# frozen_string_literal: true

module HeaderHelper
  def user_menu
    used_methods = %i[edit_profile_link logout_link]
    case controller_name
    when 'registrations'
      used_methods.delete(:edit_profile_link)
    else
      used_methods = used_methods
    end
    create_menu(used_methods)
  end

  def no_user_menu
    used_methods = %i[login_link sign_up_link recover_password_link]
    case controller_name
    when 'sessions'
      used_methods.delete(:login_link)
    when 'registrations'
      used_methods.delete(:sign_up_link)
      used_methods.delete(:recover_password_link)
    when 'passwords'
      used_methods.delete(:recover_password_link)
    else
      used_methods = used_methods
    end
    create_menu(used_methods)
  end

  private

  # utils
  def create_menu(methods)
    methods.map do |method|
      send(method)
    end.join.html_safe
  end

  # each links
  def login_link
    link_to('Log in', new_session_path(User))
  end

  def sign_up_link
    link_to('Sign up', new_registration_path(User))
  end

  def recover_password_link
    link_to 'Forgot your password?', new_password_path(User)
  end

  def confirm_check_link
    link_to "Didn't receive confrimation instructions?", new_confirmation_path(User)
  end

  def edit_profile_link
    link_to 'Edit your profile', edit_registration_path(User)
  end

  def logout_link
    link_to 'logout', destroy_session_path(User), method: :delete
  end
end

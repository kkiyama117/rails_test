# frozen_string_literal: true

module ApplicationHelper
  def no_user_menu(view)
    used_methods = %i[login_link sign_up_link recover_password_link]
    case controller_name
    when 'sessions'
      used_methods.delete(:login_link)
    when 'registrations'
      used_methods.delete(:sign_up_link, :recover_password_link)
    when 'passwords'
      used_methods.delete(:recover_password_link)
    else
      used_methods = used_methods
    end
    used_methods.map do |method|
      send(method, view)
    end.join.html_safe
  end

  def login_link(view)
    view.raw view.link_to('Log in', new_session_path(User))
  end

  def sign_up_link(view)
    view.raw view.link_to('Sign up', new_registration_path(User))
  end

  def recover_password_link(view)
    view.raw view.link_to 'Forgot your password?', new_password_path(User)
  end

  def confirm_check_link(view)
    view.raw view.link_to "Didn't receive confrimation instructions?", new_confirmation_path(User)
  end
end

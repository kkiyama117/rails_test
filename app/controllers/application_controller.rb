# frozen_string_literal: true

# Root app controller
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  def current_user
    UserDecorator.decorate(super) if super.present?
  end
end

# frozen_string_literal: true

# Root app controller
class ApplicationController < ActionController::Base
  def current_user
    UserDecorator.decorate(super) if super.present?
  end
end

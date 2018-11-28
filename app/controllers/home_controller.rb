# frozen_string_literal: true

# index page for login user
class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index; end
end

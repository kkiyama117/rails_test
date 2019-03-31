# frozen_string_literal: true

# index page for login user
class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    render json: User.all
  end

  # GET /users/1
  def show
    render json: User.find(params[:id])
  end

  # DELETE /users/1
  def destroy
    User.find(params[:id]).delete
  end
end



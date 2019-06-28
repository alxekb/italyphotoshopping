class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_admin

  def index
    @users = User.all
    @tracking_status = tracking_status("AFLT16341508")
  end

  def show
  end

  def edit
  end

  private

  def user_is_admin
    # if user_signed_in? && current_user.admin?
    #   # redirect_to users_path
    #   render 'index'
    # else
    #   redirect_to root_path
    # end
  end
end

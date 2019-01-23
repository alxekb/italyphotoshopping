class UsersController < ApplicationController
  before_action :user_is_admin
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private

  def user_is_admin
    if current_user.try(:admin?)
      redirect_to users_index_path
    else
      redirect_to root_path
    end
  end
end

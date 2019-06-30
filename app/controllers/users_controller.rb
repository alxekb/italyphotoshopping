class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_admin

  def index
    @tracking_status = 0
    if params[:search]
      @users = Profile.where('name LIKE ?', "%#{params[:search]}%")
    else
      @users = Profile.all
    end
  end

  def show
    @user =User.find_by(id: params[:id])
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

  def user_params
    params.require(:user).permit(:search)
  end
end

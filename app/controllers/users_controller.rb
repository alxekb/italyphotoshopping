# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_admin

  def index
    @tracking_status = 0
    params[:search] ? @users = Profile.where('surname LIKE ?', "%#{params[:search]}%") : @users = Profile.all
  end

  def show
    @user = Profile.find_by(id: params[:id])
  end

  def edit; end

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

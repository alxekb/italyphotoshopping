class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def index
    @user = current_user.id
  end

  def new
    @profile = current_user.build_profile
  end


  def show
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    respond_to do |format|
      if @profile.save
        flash[:success] = "Profile Saved"
        format.html { redirect_to profile_url }
      else
        flash[:error] = "Error saving profile!"
        format.html { render :show }
      end
    end
  end

  protected

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(
      :name, :second_name, :surname, :country_code, :email, :passport_code, :passport_number, :passport_date_issue, :passport_issuer, :notification_number, :notification_code, :inn, :phone, :dob, :boxberry_office_id
    )
  end
end

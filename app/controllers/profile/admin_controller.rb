class Profile::AdminController < ProfileController
  before_action :authenticate_user!

  def index; end

  def new_client; end

  def show; end
end

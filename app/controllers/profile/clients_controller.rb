# frozen_string_literal: true

class Profile::ClientsController < ProfileController
  def index
    @clients = User.all
  end

  def show
    client
  end

  def edit
    client
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to profile_client_path(@client)
    flash[:notice] = 'client created!'
  end

  def update
    client
    if @client.update(client_params)
      redirect_to profile_client_path(@client)
      flash[:notice] = 'client saved!'
    else
      render :edit
      flash[:warning] = 'Error!'
    end
  end

  private

  def client
    @client = User.find_by(id: params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :ig, :wa)
  end
end

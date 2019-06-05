class Profile::ItemsController < ApplicationController
  before_action :set_profile_item, only: [:show, :edit, :update, :destroy]

  # GET /profile/items
  # GET /profile/items.json
  def index
    @profile_items = Profile::Item.all
  end

  # GET /profile/items/1
  # GET /profile/items/1.json
  def show
  end

  # GET /profile/items/new
  def new
    @profile_item = Profile::Item.new
  end

  # GET /profile/items/1/edit
  def edit
  end

  # POST /profile/items
  # POST /profile/items.json
  def create
    @profile_item = Profile::Item.new(profile_item_params)

    respond_to do |format|
      if @profile_item.save
        format.html { redirect_to @profile_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @profile_item }
      else
        format.html { render :new }
        format.json { render json: @profile_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile/items/1
  # PATCH/PUT /profile/items/1.json
  def update
    respond_to do |format|
      if @profile_item.update(profile_item_params)
        format.html { redirect_to @profile_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_item }
      else
        format.html { render :edit }
        format.json { render json: @profile_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/items/1
  # DELETE /profile/items/1.json
  def destroy
    @profile_item.destroy
    respond_to do |format|
      format.html { redirect_to profile_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_item
      @profile_item = Profile::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_item_params
      params.require(:profile_item).permit(:item, :brand, :color, :price, :cost)
    end
end

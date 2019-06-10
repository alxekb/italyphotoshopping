class Profile::DealsController < ProfileController
  before_action :set_profile_deal, only: [:show, :edit, :update, :destroy]

  # GET /profile/deals
  # GET /profile/deals.json
  def index
    @profile_deals = Profile::Deal.all
  end

  # GET /profile/deals/1
  # GET /profile/deals/1.json
  def show
  end

  # GET /profile/deals/new
  def new
    @profile_deal = Profile::Deal.new
  end

  # GET /profile/deals/1/edit
  def edit
  end

  # POST /profile/deals
  # POST /profile/deals.json
  def create
    @profile_deal = Profile::Deal.new(profile_deal_params)

    respond_to do |format|
      if @profile_deal.save
        format.html { redirect_to @profile_deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @profile_deal }
      else
        format.html { render :new }
        format.json { render json: @profile_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile/deals/1
  # PATCH/PUT /profile/deals/1.json
  def update
    respond_to do |format|
      if @profile_deal.update(profile_deal_params)
        format.html { redirect_to @profile_deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_deal }
      else
        format.html { render :edit }
        format.json { render json: @profile_deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/deals/1
  # DELETE /profile/deals/1.json
  def destroy
    @profile_deal.destroy
    respond_to do |format|
      format.html { redirect_to profile_deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_deal
      @profile_deal = Profile::Deal.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_deal_params
      params.fetch(:profile_deal, {}).permit(:paid, :byed, :messenger, :buy,
                                             :sell, :client_id, :item_id)
    end
end

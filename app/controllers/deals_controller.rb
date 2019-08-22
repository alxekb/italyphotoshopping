# frozen_string_literal: true

class DealsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!
  before_action :set_deal, only: %i[show edit update destroy]

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.where(package_id: nil)
    @boxberry = Deal.where.not(package_id: nil)
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    if @deal.profile.boxberry_office_id.present? && @deal.weight.present? && @deal.sell.present?
      @cost = shipping_cost(@deal.profile.boxberry_office_id.to_i, @deal.weight.to_i, 1, 0, @deal.sell.to_i)
    else
      @cost = 0
    end
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    @deal.item_id = params[:item]
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)

    respond_to do |format|
      if @deal.save(validate: false)
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shipping_cost(code, weight, type, insurance, sum)
    url = "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"

    conn = Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.response :logger
    end

    response = conn.get
    response.body

    # Входящие параметры:
    # weight - вес посылки в граммах,
    # type - тип доставки (1 - выдача в ПВЗ, 2 - Курьерская доставка (КД)),
    # target - код ПВЗ или почтовый индекс для type=2,
    # ordersum - cтоимость заказа в евро (0 если пустое),
    # insurance - страховка, по желанию клиента (1 - да, 0 - нет (0 если пустое)).
    # "http://api.boxberry.de/json.php?token=86391.rfpqbbee&method=DeliveryCostsF&weight=#{weight}&type=#{type}&target=#{code}&ordersum=#{sum}&insurance=#{insurance}"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deal_params
    params.require(:deal).permit(:profile_id, :item_id, :bye, :sell, :status, :messenger, :paid, :ransom, :comment, :payment_method, :h, :w, :l, :weight)
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.where('status = ?', 'active')
    @profile = Profile.find_by(id: @orders.pluck(:user_id))
    @items = Item.find_by(id: @orders.pluck(:item_id))
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was succesfully created.'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = User.find_by(id: @order.user_id)
    @profile = Profile.find_by(id:[@user.id])
    @item = Item.find_by(id: @order.item_id)
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end


  private

  def order_params
    params.require(:order).permit(
      :item_id, :user_id, :status, :payment_status, :tracking_number
    )
  end

  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.find(params[:id])
  end
end

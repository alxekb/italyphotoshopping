class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @orders = Order.all
  end

  def new
    @order = current_user.orders.build
    @item = Item.find(params[:id])
  end

  def create
    @order = current_user.orders.build(order_params)
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def order_params
    params.require(:item).permit(
      :item_id
    )
  end

  def set_user
    @user = current_user
  end
end

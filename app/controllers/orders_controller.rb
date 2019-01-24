class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @orders = Order.all
    @profile = Profile.find_by(id: @orders.pluck(:user_id))
    @items = Item.find_by(id: @orders.pluck(:item_id))

  end

  def new
    @order = Order.new
    @items = Item.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to @order
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
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(
      :item_id, :user_id
    )
  end

  def set_user
    @user = current_user
  end
end

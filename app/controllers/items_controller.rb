# -- Table Definition ----------------------------------------------

# CREATE TABLE items (
#     id      BIGSERIAL PRIMARY KEY,
#     item    string,
#     brand    string,
#     name    string,
#     color    string,
#     size    string,
#     ean    bigint,
#     art    bigint,
#     price    double precision,
#     discount    integer,
#     available    boolean,
#     created_at timestamp without time zone NOT NULL,
#     updated_at timestamp without time zone NOT NULL
# );

# -- Indices -------------------------------------------------------

# CREATE UNIQUE INDEX items_pkey ON items(id int8_ops);
#

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # validates :image, presence: true

  def index
    @items = Item.order(:brand_id)
  end

  def show
    @item = Item.find(params[:id])
    # if current.user.image.attached? @item.image
    # else @item.image = image_tag ''
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to @item
      flash[:success] = 'Лот успешно создан.'
    else
      render action: 'edit'
      flash[:warning] = 'Error, item not saved!'
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
    authorize @item, :update?
  end

  def update
    @item = Item.find(params[:id])
    authorize @item, :update?
    if @item.update_attributes(params[:item])
      format.html  { redirect_to(@item,
                    :notice => 'Item was successfully updated.') }
    else
      render :action => "edit"
    end

  end

  def new
    # @item = current_user.items.build
    @item = Item.new
  end

  def destroy
    @item = Item.find(params:[:id])
    @item.destroy
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:item, :brand_id, :model_id, :item_name_id,
                                 :color_id, :size_id, :name, :color,:size,
                                 :art, :ean, :price, :eur_price, :string,
                                 :image)
  end

end

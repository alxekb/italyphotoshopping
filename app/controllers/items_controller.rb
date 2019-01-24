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
    @items = Item.all
  end

  def show
    @item = Item.friendly.find(params[:id])
    # if current.user.image.attached? @item.image
    # else @item.image = image_tag ''
  end

  def create
#    @bulletin = Bulletin.new()
#    @bulletin.attachment(params[:bulletin][:attachment])
#    @bulletin.save!
    @item = current_user.items.build(item_params)
    @item.save
#    @item.image.attach(params[:image])
    redirect_to @item
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      format.html  { redirect_to(@item,
                    :notice => 'Item was successfully updated.') }
    else
      render :action => "edit"
    end

  end

  def new
    @item = current_user.items.build
  end

  def destroy
    @item = Item.find(params:[:id])
    @item.destroy
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:item, :brand, :name, :color,:size, :art, :ean, :price, :eur_price, :string, :image)
  end

end

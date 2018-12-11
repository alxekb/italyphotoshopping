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
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
#    @bulletin = Bulletin.new()
#    @bulletin.attachment(params[:bulletin][:attachment])
#    @bulletin.save!
    @item = current_model.items.build(item_params)
    @item.save
#    @item.image.attach(params[:image])
    redirect_to @item
  end

  def update
  end

  def new
    @item = current_model.items.build
  end

  private

  def item_params
    params.require(:item).permit(:item, :brand, :name, :color,:size, :art, :ean, :price, :string, :image)
  end

end

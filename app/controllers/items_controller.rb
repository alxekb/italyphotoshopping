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
    @item = Item.new(item_params)
    @item.save
    redirect_to @item
  end

  def update
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name, :string, {photos: []})
  end

end

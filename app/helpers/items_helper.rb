module ItemsHelper
  def items_for_package(i)
    @item = Item.find_by(id: i)
    # return [@item.item_name.name, @item.brand.name, @item.model.name, @item.color.name, @item.size.name, '/',@item.eur_price,'EUR, EAN ', @item.ean,', ART', @item.art, ', ',@item.price, 'RUB.'].join(' ')
  end

  def items_for_partial(items)
  end
end

class Item < ApplicationRecord
  has_one_attached :image
  has_many :orders
  belongs_to :brand
  belongs_to :item_name
  belongs_to :model
  belongs_to :color
  belongs_to :size

  # extend FriendlyId
  # friendly_id :name, use: :slugged
  has_many :deals

  def slug_items
    [
      :name,
      [:name, :brand],
      [:name, :item, :brand],
      [:name, :color, :item, :brand]
    ]
  end

  def item_full_name
    self.id
    # self.item_name.name + " " + self.brand.name + " " + self.model.name + " " self.color.name + " " + self.size.name
  end
end

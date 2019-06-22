class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :item_name
  belongs_to :model
  belongs_to :color
  belongs_to :size

  has_one_attached :image
  has_many :orders
  has_many :deals

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  def slug_items
    [
      :name,
      [:name, :brand],
      [:name, :item, :brand],
      [:name, :color, :item, :brand]
    ]
  end

  def item_full_name
    [self.item_name.name, self.brand.name, self.model.name, self.color.name, self.size.name].join(" ")
  end

  def item_full_name_with_id
    ["##{self.id}", self.item_name.name, self.brand.name, self.model.name, self.color.name, self.size.name].join(" ")
  end
end

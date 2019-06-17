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
end

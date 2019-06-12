class Item < ApplicationRecord
  has_one_attached :image
  has_many :orders
  # extend FriendlyId
  # friendly_id :name, use: :slugged
  has_many :profile_deals

  def slug_items
    [
      :name,
      [:name, :brand],
      [:name, :item, :brand],
      [:name, :color, :item, :brand]
    ]
  end
end

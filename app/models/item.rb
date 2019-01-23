class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :order
  extend FriendlyId
  friendly_id :name, use: :slugged
end

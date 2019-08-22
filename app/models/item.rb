# frozen_string_literal: true

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
      %i[name brand],
      %i[name item brand],
      %i[name color item brand]
    ]
  end

  def item_full_name
    [item_name.name, brand.name, model.name, color.name, size.name].join(' ')
  end

  def item_full_name_with_id
    ["##{id}", item_name.name, brand.name, model.name, color.name, size.name].join(' ')
  end
end

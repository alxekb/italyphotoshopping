class Deal < ApplicationRecord
  belongs_to :profile
  belongs_to :item
end

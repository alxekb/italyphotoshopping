class Deal < ApplicationRecord
  belongs_to :profile
  belongs_to :package
  belongs_to :item
end

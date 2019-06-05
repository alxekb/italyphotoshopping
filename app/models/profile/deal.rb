class Profile::Deal < ApplicationRecord
  belongs_to :client
  belongs_to :item
end

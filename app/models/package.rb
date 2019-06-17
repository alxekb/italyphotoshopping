class Package < ApplicationRecord
  belongs_to :profile
  has_many :deals
end

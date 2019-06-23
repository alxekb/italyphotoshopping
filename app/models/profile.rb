class Profile < ApplicationRecord
  has_many :deals
  has_many :packages
  belongs_to :user

  def full_name_with_id
    ["##{self.id}",self.name, self.second_name, self.surname].join(' ')
  end


  def full_name
    [self.name, self.second_name, self.surname].join(' ')
  end
end

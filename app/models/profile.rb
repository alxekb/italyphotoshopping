class Profile < ApplicationRecord
  belongs_to :user

  def full_name
    self.name + " " + self.second_name + " " + self.surname
  end
end

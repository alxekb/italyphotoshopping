# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :deals
  has_many :packages
  belongs_to :user

  def full_name_with_id
    ["##{id}", name, second_name, surname].join(' ')
  end

  def full_name
    [name, second_name, surname].join(' ')
  end
end

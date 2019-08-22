# frozen_string_literal: true

class Batch < ApplicationRecord
  belongs_to :batch_status
  has_many :packages
  accepts_nested_attributes_for :packages
end

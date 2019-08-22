# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :profile
  belongs_to :batch
  has_many :deals, dependent: :nullify
end

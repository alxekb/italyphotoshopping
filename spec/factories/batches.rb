# frozen_string_literal: true

FactoryBot.define do
  factory :batch do
    batch_status { nil }
    parcel { nil }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :deal do
    profile
    item
    bye { '9.99' }
    sell { '9.99' }
    status { 'okay' }
    messenger { 'wa' }
    paid { false }
    ransom { '' }
    comment { 'MyText' }
    payment_method { 'Stripe' }
    package
  end
end

FactoryBot.define do
  factory :package do
    shipping_type { 1 }
    h { 23 }
    w { 12 }
    l { 23 }
    weight { 390 }
    batch
    profile
  end
end

FactoryBot.define do
  factory :item do
    brand
    item_name
    model
    color
    size
    price { 89 }
    eur_price { 105 }
    ean { '123123123' }
    art { '12312312' }
    image {  }
  end

  factory :brand do
    name { 'Furla' }
  end

  factory :item_name do
    name { 'Сумка' }
  end

  factory :name do
    name { 'name' }
  end

  factory :model do
    name { 'Model' }
  end

  factory :color do
    name { Faker::Color.color_name }
  end

  factory :size do
    name { 'M' }
  end

  factory :art do
    art { '123321' }
  end

  factory :ean do
    ean { '123321123' }
  end

end

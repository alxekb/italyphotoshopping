FactoryBot.define do
  factory :profile_item, class: 'Profile::Item' do
    item { "MyString" }
    brand { "MyString" }
    color { "MyString" }
    price { 1 }
    cost { 1 }
  end
end

FactoryBot.define do
  factory :deal do
    profile { nil }
    item { nil }
    bye { "9.99" }
    sell { "9.99" }
    status { "MyString" }
    messenger { "MyString" }
    paid { false }
    ransom { "" }
    comment { "MyText" }
    payment_method { "MyString" }
  end
end

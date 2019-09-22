FactoryBot.define do
  factory :user do
    email { '01@test.com' }
    password { '123123123' }

    factory :faker do
      email { Faker::Internet.email }
      password { 'super-password' }
    end
  end

  factory :admin do
    email { Faker::Internet.email }
    password { 'super-password' }
    admin { true }
  end

  factory :profile do
    association :user, factory: :faker
    name { Faker::Name.name }
    second_name { Faker::Name.middle_name }
    surname { Faker::Name.last_name }
  end
end

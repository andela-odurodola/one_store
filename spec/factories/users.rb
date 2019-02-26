FactoryGirl.define do
  factory :user do
    name { Faker::Name.name}
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
    password {Faker::Internet.password }
    admin false
  end
end

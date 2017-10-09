FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.word}
    description { Faker::Lorem.sentence }
    quantity { Faker::Number.digit }
  end
end
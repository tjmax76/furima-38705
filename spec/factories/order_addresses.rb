FactoryBot.define do
  factory :order_address do
    post_address { Faker::Address.postcode }
    prefecture_id { rand(2..48) }
    city_ward_town_village { Faker::Lorem.word }
    house_number { Faker::Address.street_address }
    building_name { Faker::Lorem.word }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

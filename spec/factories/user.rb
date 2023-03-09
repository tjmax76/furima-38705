FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    nickname {Faker::Internet.user_name}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    katakana_first_name {'テスト'}
    katakana_last_name {'テスト'}
    birth_day {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
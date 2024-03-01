FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"あ"}
    last_name             {"あ"}
    last_name_kana        {"ア"}
    first_name_kana       {"ア"}
    birthday              {Faker::Date.birthday}
  end
end
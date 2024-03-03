FactoryBot.define do
  factory :item do
    name              { '商品の名前' }
    description       { '商品の説明' }
    price             { 10_000 }
    category_id       { 3 }
    spec_id           { 3 }
    pref_id           { 5 }
    shipping_fee_id   { 2 }
    shipping_day_id   { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/de.png'), filename: 'de.png', content_type: 'image/png')
    end
  end
end

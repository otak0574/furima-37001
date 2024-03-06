FactoryBot.define do
  factory :purchase_address do
    post_number       { '123-1234' }
    pref_id           { 5 }
    city              { '渋谷区' }
    street_address    { '道玄坂１丁目１' }
    building          { 'テスト' }
    telephone_number { '08012341234' }
  end
end

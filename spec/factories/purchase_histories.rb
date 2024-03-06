FactoryBot.define do
  factory :purchase_history do
    post_number     { 123-1234 }
    pref_id         { 1 }
    city            { '渋谷区' }
    street_address  { '道玄坂１丁目１' }
    building        { 'テストハイツ'}
    telephone_number{ '12312341234' }
  end
end

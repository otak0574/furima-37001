class ItemInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
  belongs_to :category
  belongs_to :spec
  belongs_to :shipping_fee
  belongs_to :pref
  belongs_to :shipping_day


  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
end

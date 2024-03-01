class ItemInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
  belongs_to :category
end

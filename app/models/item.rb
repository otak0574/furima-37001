class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :spec_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :pref_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end

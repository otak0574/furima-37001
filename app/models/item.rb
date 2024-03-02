class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  with_options presence: true, format: {with: /\A[0-9]+\z/} do
    validates :price
  end
end

class Item < ApplicationRecord

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  with_options presence: true, format: {with: /\A[0-9]+\z/} do
    validates :price
  end
end

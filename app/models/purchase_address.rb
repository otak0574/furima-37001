class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :pref_id, :city, :street_address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(- " }
    validates :pref_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
    validates :city
    validates :street_address
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id )
    ShippingAddress.create(purchase_history_id: purchase_history.id, post_number: post_number, city: city, street_address: street_address, building: building, telephone_number: telephone_number, pref_id: pref_id)
  end
end
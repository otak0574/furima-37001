class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_number, null: false
      t.integer :pref_id, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building, null: false
      t.string :telephone_number, null: false
      t.references :purchase_history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :price,            null: false
      t.string :name,              null: false
      t.text :description,         null: false
      t.integer :category_id,      null: false
      t.integer :spec_id,          null: false
      t.integer :shipping_fee_id,  null: false
      t.integer :pref_id,          null: false
      t.integer :shipping_day_id,  null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
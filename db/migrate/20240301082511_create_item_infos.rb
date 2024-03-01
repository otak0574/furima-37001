class CreateItemInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :item_infos do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :category_id  , null: false
      t.integer    :spec_id      , null: false
      t.integer    :shipping_fee_id, null: false 
      t.integer    :pref_id,       null: false
      t.integer    :shipping_day_id, null: false
      t.timestamps
    end
  end
end

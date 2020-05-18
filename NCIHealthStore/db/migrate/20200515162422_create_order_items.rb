class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :purchase_order, index: true
      t.string :item_title
      t.string :item_description
      t.integer :item_quantity
      t.decimal :item_price

      t.timestamps
    end
  end
end

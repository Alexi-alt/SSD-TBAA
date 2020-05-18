class CreatePurchaseOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_orders do |t|
      t.string :client_number
      t.string :delivery_address
      t.string :delivery_city
      t.string :delivery_country
      t.decimal :delivery_fee
      t.decimal :total

      t.timestamps
    end
  end
end

class PurchaseOrder < ApplicationRecord
    
    has_many :order_items
    
    validates :client_number, :delivery_address, :delivery_city, :delivery_country, :delivery_fee, presence: true
    
    def calculate_total
        order_items.inject(0){|sum,i| sum += i.item_quantity * i.item_price}+ delivery_fee.to_s.to_d
    end
    
end

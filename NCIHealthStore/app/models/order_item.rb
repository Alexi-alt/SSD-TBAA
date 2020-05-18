class OrderItem < ApplicationRecord
    
    belongs_to :purchase_order, inverse_of: :order_items
    validates_presence_of :purchase_order
    
    validates :item_title,  :item_description, :item_quantity, :item_price, presence: true
    
end

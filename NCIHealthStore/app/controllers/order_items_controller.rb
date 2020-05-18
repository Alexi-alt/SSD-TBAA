class OrderItemsController < ApplicationController
  
  before_action :purchase_order_required, except: [:index]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  ##needed
  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = purchase_order.order_items.new
  end

  def edit
  end

  def create
    @order_item = purchase_order.order_items.new(order_item_params)
    if @order_item.save
      purchase_order_update_total
      redirect_to purchase_order_path(params[:purchase_order_id]), notice: 'Order item was successfully created.'
    else
      flash[:warning] = @order_item.errors.full_messages.first
      redirect_to new_purchase_order_order_item_path(params[:purchase_order_id])
    end
  end


  def update
    if @order_item.update(order_item_params)
      purchase_order_update_total
      redirect_to purchase_order_path(params[:purchase_order_id]), notice: 'Order item was successfully updated.'
    else
      flash[:warning] = @order_item.errors.full_messages.first
      redirect_to edit_purchase_order_order_item_path(params[:purchase_order_id])
    end
  end

  def destroy
    @order_item.destroy
    purchase_order_update_total
    redirect_to purchase_order_path(params[:purchase_order_id]), notice: 'Order item was successfully destroyed.'
  end

  private
  
    def set_order_item
      @order_item = purchase_order.order_items.find(params[:id]) if purchase_order.present?
    end
    
    def purchase_order
      ##if po is empty, it will fill the variable with the db
      @purchase_order ||= PurchaseOrder.find_by(id: params[:purchase_order_id])
    end    
    

    def order_item_params
      params.require(:order_item).permit(:item_title, :item_description, :item_quantity, :item_price)
    end
    
    def purchase_order_required
      redirect_to(purchase_orders_path, alert: 'Purchase order not found.') unless purchase_order.present?
    end
    
    def purchase_order_update_total
      total = purchase_order.calculate_total
      purchase_order.update_attribute(:total, total)
      purchase_order.save
    end
    
end

class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]

  def index
    @purchase_orders = PurchaseOrder.all
  end

  def show
  end

  def new
    @purchase_order = PurchaseOrder.new
  end

  def edit
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save 
      purchase_order_update_total
      redirect_to @purchase_order, notice: 'Purchase order was successfully created.' 
    else
      flash[:warning] = @purchase_order.errors.full_messages.first
      redirect_to new_purchase_order_path
    end
  end

  def update
    if @purchase_order.update(purchase_order_params)
      purchase_order_update_total
      redirect_to @purchase_order, notice: 'Purchase order was successfully updated.'
    else
      flash[:warning] = @purchase_order.errors.full_messages.first
      redirect_to edit_purchase_order_path
    end
  end

  def destroy
    @purchase_order.destroy
    redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.'
  end

  private
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    def purchase_order_params
      params.require(:purchase_order).permit(:client_number, :delivery_address, :delivery_city, :delivery_country, :delivery_fee, :total)
    end
    
    def purchase_order_update_total
      total = @purchase_order.calculate_total
      @purchase_order.update_attribute(:total, total)
      @purchase_order.save
    end
    
end

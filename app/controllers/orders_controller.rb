class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new()
    product_details = []
    if @order.save
      params[:products].each do |product|
        @order.order_products.create(product_id: product[:id], quantity: product[:quantity])
      end
      amount = @order.order_products.sum(:effective_amount)
      effective_amount = (@order.order_products.sum(:effective_amount) - 20 ) if @order.order_products.sum(:effective_amount) > 150
      @order.update(amount: amount, effective_amount: effective_amount)
      @order.order_products.each do |op|
       product_details << {
        "name": op.product.name,
        "effective_amount": op.effective_amount,
        "amount": op.amount,
        "quantity": op.quantity
       }
     end
      render json: {cart_amount: @order.amount, cart_effective_amount: @order.effective_amount, product_details: product_details}, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {})
    end
end

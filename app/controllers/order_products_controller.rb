class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  # GET /order_products
  # GET /order_products.json
  def index
    @order_products = OrderProduct.all
  end

  # GET /order_products/1
  # GET /order_products/1.json
  def show
  end

  # GET /order_products/new
  def new
    @order_product = OrderProduct.new
  end

  # GET /order_products/1/edit
  def edit
  end

  # POST /order_products
  # POST /order_products.json
  def create
    @order = current_order
    @product = @order.order_products.new(product_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  # PATCH/PUT /order_products/1
  # PATCH/PUT /order_products/1.json
  def update
    debugger
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order_product, notice: 'Order product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_products/1
  # DELETE /order_products/1.json
  def destroy
    @order = current_order
    @product = @order.order_products.find(params[:id])
    @product.destroy
    @order.save
    redirect_to cart_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_product_params
      params.require(:order_product).permit(:quantity, :product_id, :order_id)
    end

    def product_params
      params.require(:order_product).permit(:quantity, :product_id)
    end
end

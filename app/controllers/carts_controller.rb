class CartsController < ApplicationController

  def show
    @order_products = current_order.order_products
    debugger
  end
end

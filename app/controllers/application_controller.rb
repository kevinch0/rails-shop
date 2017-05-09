class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else

      @order = Order.new
      @order.account_id = current_user.account.id
      @order.save
      Order.last

    end
  end
end

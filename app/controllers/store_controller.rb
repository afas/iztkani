class StoreController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :find_cart, :only => :empty_cart

  def add_to_cart
    action_to_cart :add_product
  end

  def remove_from_cart
    action_to_cart :remove_product
  end

  def empty_cart
    session[:cart] = nil
  end

  private

  def action_to_cart cart_action
    product = Product.find params[:id]
    cart_method = @cart.method cart_action
    @current_item = cart_method.call product
  rescue ActiveRecord::RecordNotFound
    logger.error "Attempt to access invalid product #{params[:id]}"
  end

end

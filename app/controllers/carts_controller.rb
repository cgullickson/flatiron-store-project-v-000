class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.status = "submitted"
    @cart.save
    @cart.line_items.each do |l|
      l.item.inventory -= l.quantity
      l.item.save
    end
    current_user.remove_cart
    redirect_to cart_path(@cart)
  end


end

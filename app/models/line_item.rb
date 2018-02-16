class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def create
    current_user.create_current_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end
end

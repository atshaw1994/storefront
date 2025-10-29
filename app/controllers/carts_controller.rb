class CartsController < ApplicationController
  def add
    # Find or create the current user's cart
    @cart = current_cart
    product = Product.find(params[:product_id])
    item = @cart.cart_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
      item.save
    else
      @cart.cart_items.create(product: product, quantity: 1)
    end
    redirect_to page_path('store')
  end

  def remove_one
    @cart = current_cart
    item = @cart.cart_items.find_by(product_id: params[:product_id])
    if item
      item.quantity -= 1
      if item.quantity <= 0
        item.destroy
      else
        item.save
      end
    end
    redirect_to page_path('store')
  end

  def remove
    @cart = current_cart
    item = @cart.cart_items.find_by(product_id: params[:product_id])
    item.destroy if item
    redirect_to page_path('store')
  end

  private

  def current_cart
    Cart.for_session(session.id.to_s)
  end
end

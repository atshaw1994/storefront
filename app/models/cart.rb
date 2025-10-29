class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  # Find or create a cart for the current session
  def self.for_session(session_id)
    find_or_create_by(session_id: session_id)
  end

  def total_price
    cart_items.joins(:product).sum('cart_items.quantity * products.price')
  end
end

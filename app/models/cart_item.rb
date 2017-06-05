class CartItem < ActiveRecord::Base
  # ---- relationships ----

  belongs_to :cart
  belongs_to :product

  # ---- validates ----

  validates :quantity, numericality: { greater_than: 0, allow_blank: false }
  validates :cart, :product, presence: true

  # ---- methods ----

  def price
    product.price * quantity
  end
end

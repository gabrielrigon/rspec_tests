class Cart < ActiveRecord::Base
  # ---- relationships ----

  has_many :cart_items
  has_many :products, through: :cart_items

  # ---- validates ----

  validates :customer, presence: true
  validates :cart_items, presence: true

  # ---- methods ----

  def subtotal
    value = 0.0

    cart_items.each do |cart_item|
      value += cart_item.price
    end

    value
  end

  def discount
    case customer

    when 'A'
      subtotal > 500 ? 0.1 : 0
    when 'B'
      subtotal > 300 ? 0.05 : 0
    else
      0
    end
  end

  def total
    subtotal - (subtotal * discount)
  end
end

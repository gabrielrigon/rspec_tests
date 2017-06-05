class Product < ActiveRecord::Base
  # ---- relationships ----

  has_many :cart_items
  has_many :carts, through: :cart_items

  # ---- validates ----

  validates :name, length: { minimum: 1, maximum: 7, allow_blank: false }
  validates :price, numericality: { greater_than: 0, allow_blank: false }
end

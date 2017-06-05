require 'rails_helper'
require 'spec_helper'
require 'cart_item'

describe CartItem do
  c1 = Cart.new customer: 'A'
  p1 = Product.new name: 'Mouse', price: 30

  context 'deve ser válido' do
    it 'quando carrinho é vinculado, produto é vinculado e quantidade > 0' do
      cart_item = CartItem.new cart: c1, product: p1, quantity: 1
      expect(cart_item).to be_valid
    end
  end

  context 'deve ser inválido' do
    it 'quando carrinho não é vinculado' do
      cart_item = CartItem.new product: p1, quantity: 1
      expect(cart_item).to be_invalid
    end

    it 'quando produto não é vinculado' do
      cart_item = CartItem.new cart: c1, quantity: 1
      expect(cart_item).to be_invalid
    end

    it 'quando quantidade não é preenchida' do
      cart_item = CartItem.new cart: c1, product: p1
      expect(cart_item).to be_invalid
    end

    it 'quando quantidade é preenchida c/ número negativo' do
      cart_item = CartItem.new cart: c1, product: p1, quantity: -1
      expect(cart_item).to be_invalid
    end
  end
end

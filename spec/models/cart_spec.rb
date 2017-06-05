require 'rails_helper'
require 'spec_helper'
require 'cart'

describe Cart do
  p1 = Product.new name: 'Mouse', price: 30
  p2 = Product.new name: 'Teclado', price: 50
  p3 = Product.new name: 'Monitor', price: 250

  i1 = CartItem.new product: p1, quantity: 1
  i2 = CartItem.new product: p2, quantity: 5
  i3 = CartItem.new product: p3, quantity: 1

  context 'deve ser válido' do
    it 'quando cliente é preenchido e tem produtos' do
      cart = Cart.new customer: 'A', cart_items: [i1, i3]
      expect(cart).to be_valid
    end
  end

  context 'deve ser inválido' do
    it 'quando cliente não é preenchido' do
      cart = Cart.new cart_items: [i1, i3]
      expect(cart).to be_invalid
    end

    it 'quando cliente é preenchido mas não tem produtos' do
      cart = Cart.new customer: 'A'
      expect(cart).to be_invalid
    end
  end

  context 'quando cliente A' do
    context 'com valor < que 500' do
      it 'retorna 0 de desconto' do
        cart = Cart.new customer: 'A', cart_items: [i1, i3]
        expect(cart.discount).to eq(0)
      end
    end

    context 'com valor > que 500' do
      it 'retorna 0.1 de desconto' do
        cart = Cart.new customer: 'A', cart_items: [i1, i2, i3]
        expect(cart.discount).to eq(0.1)
      end

      it 'retorna valor já com desconto de 0.1 aplicado' do
        cart = Cart.new customer: 'A', cart_items: [i1, i2, i3]
        expect(cart.total).to eq(477)
      end
    end
  end

  context 'quando cliente B' do
    context 'com valor < que 300' do
      it 'retorna 0 de desconto' do
        cart = Cart.new customer: 'B', cart_items: [i1, i3]
        expect(cart.discount).to eq(0)
      end
    end

    context 'com valor > que 300' do
      it 'retorna 0.05 de desconto' do
        cart = Cart.new customer: 'B', cart_items: [i1, i2, i3]
        expect(cart.discount).to eq(0.05)
      end

      it 'retorna valor já com desconto de 0.05 aplicado' do
        cart = Cart.new customer: 'B', cart_items: [i1, i2, i3]
        expect(cart.total).to eq(503.5)
      end
    end
  end

  context 'quando cliente C' do
    context 'com qualquer valor' do
      it 'retorna 0 de desconto' do
        cart = Cart.new customer: 'C', cart_items: [i1, i2, i3]
        expect(cart.total).to eq(530)
      end
    end
  end
end

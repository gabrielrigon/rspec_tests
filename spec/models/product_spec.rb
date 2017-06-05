require 'rails_helper'
require 'spec_helper'
require 'product'

describe Product do
  context 'deve ser válido' do
    it 'quando nome é preenchido c/ <= 7 char e valor positivo > que 0' do
      product = Product.new name: 'Mouses', price: 13.5
      expect(product).to be_valid
    end
  end

  context 'deve ser inválido' do
    it 'quando nome não é preenchido' do
      product = Product.new price: 13.5
      expect(product).to be_invalid
    end

    it 'quando nome é preenchido e > que 7 char' do
      product = Product.new name: 'Computador'
      expect(product).to be_invalid
    end

    it 'quando valor não é preenchido' do
      product = Product.new name: 'Mouse'
      expect(product).to be_invalid
    end

    it 'quando valor é preenchido c/ número negativo' do
      product = Product.new name: 'Mouse', price: -10.5
      expect(product).to be_invalid
    end
  end
end

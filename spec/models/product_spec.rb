require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category_test= Category.new
      @product = Product.new(name: "Ring", price: 100, quantity: 10, category: @category_test)
    end

    it "saves when all fields are valid" do     
      expect(@product).to be_valid
    end

    it 'should have name' do
      @product.name=nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have price' do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have quantity' do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have category' do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end

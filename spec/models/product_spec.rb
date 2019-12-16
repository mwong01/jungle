require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    before(:each) do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new(name: "yo", price: 88888, quantity: 50, category: @category)  
    end

    it "is valid with all fields" do
      expect(@product).to be_valid
    end

    it "does not contain a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "does not have quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "does not have a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end

    it "does not have a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

  end
end

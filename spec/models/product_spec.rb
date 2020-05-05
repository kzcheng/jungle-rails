require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    before(:all) do
      @test_category = Category.new
    end

    it "is valid with valid attributes" do
      test_product = Product.new(
        "name": "test",
        "price": 50,
        "quantity": 50,
        "category": @test_category,
      )
      expect(test_product).to be_valid
    end

    it "is not valid without a name" do
      test_product = Product.new(
        "price": 50,
        "quantity": 50,
        "category": @test_category,
      )
      test_product.validate
      expect(test_product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      test_product = Product.new(
        "name": "test",
        "quantity": 50,
        "category": @test_category,
      )
      test_product.validate
      expect(test_product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      test_product = Product.new(
        "name": "test",
        "price": 50,
        "category": @test_category,
      )
      test_product.validate
      expect(test_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      test_product = Product.new(
        "name": "test",
        "price": 50,
        "quantity": 50,
      )
      test_product.validate
      expect(test_product.errors.full_messages).to include("Category can't be blank")
    end

    it "is not valid with multiple missing data" do
      test_product = Product.new(
        "price": 50,
        "quantity": 50,
      )
      test_product.validate
      expect(test_product.errors.full_messages).to include("Name can't be blank", "Category can't be blank")
    end
  end
end

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
      expect(test_product).to be_invalid
    end

    it "is not valid without a price" do
      test_product = Product.new(
        "name": "test",
        "quantity": 50,
        "category": @test_category,
      )
      expect(test_product).to be_invalid
    end

    it "is not valid without a quantity" do
      test_product = Product.new(
        "name": "test",
        "price": 50,
        "category": @test_category,
      )
      expect(test_product).to be_invalid
    end

    it "is not valid without a category" do
      test_product = Product.new(
        "name": "test",
        "price": 50,
        "quantity": 50,
      )
      expect(test_product).to be_invalid
    end

    # it "is not valid without a category" do
    #   test_product = Product.new(
    #     "name": "test",
    #     "price": 50,
    #     "quantity": 50,
    #   )
    #   pp test_product.errors
    # end
  end
end

require "rails_helper"

RSpec.describe User, type: :model do
  describe "Creation" do
    it "can create User" do
      test_user = User.new
      expect(test_user).to be_an_instance_of(User)
    end
  end

  describe "Validations" do
    # it "is valid with valid attributes" do
    #   test_product = User.new(
    #     "name": "test",
    #     "price": 50,
    #     "quantity": 50,
    #     "category": @test_category,
    #   )
    #   expect(test_product).to be_valid
    # end
  end
end

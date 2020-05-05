require "rails_helper"

RSpec.describe User, type: :model do
  describe "Creation" do
    it "can create User" do
      test_user = User.new
      expect(test_user).to be_an_instance_of(User)
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      test_user = User.new(
        "first_name": "Kevin",
        "last_name": "Cheng",
        "email": "kevinzifancheng@gmail.com",
        "password_digest": "string",
      )
      expect(test_user).to be_valid
    end
  end
end

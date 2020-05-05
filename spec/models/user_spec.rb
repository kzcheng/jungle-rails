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
        "password": "good",
        "password_confirmation": "good",
      )
      expect(test_user).to be_valid
    end

    describe "Passwords" do
      it "is invalid if password is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password_confirmation": "good",
        )
        expect(test_user).to be_invalid
      end

      it "is invalid if password_confirmation is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
        )
        expect(test_user).to be_invalid
      end
    end
  end
end

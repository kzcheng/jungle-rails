require "rails_helper"

RSpec.describe User, type: :model do
  describe "Creation" do
    it "can create User" do
      test_user = User.new
      expect(test_user).to be_an_instance_of(User)
    end
  end

  describe "Validation" do
    it "is valid with valid attributes" do
      test_user = User.new(
        "first_name": "Kevin",
        "last_name": "Cheng",
        "email": "kevinzifancheng@gmail.com",
        "password": "good",
        "password_confirmation": "good",
      )
      test_user.validate
      expect(test_user.errors.full_messages).to be_empty
    end

    describe "Password" do
      it "is invalid if password is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password_confirmation": "good",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password can't be blank")
      end

      it "is invalid if password_confirmation is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "is invalid if passwords are not the same" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
          "password_confirmation": "bad",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    describe "Email" do
      it "is invalid if password is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password_confirmation": "good",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password can't be blank")
      end

      it "is invalid if password_confirmation is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "is invalid if passwords are not the same" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
          "password_confirmation": "bad",
        )
        test_user.validate
        expect(test_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end

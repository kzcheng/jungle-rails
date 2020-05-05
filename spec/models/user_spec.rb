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
      test_user.save
      expect(test_user.errors.full_messages).to be_empty
    end

    it "is invalid if first name is missing" do
      test_user = User.new(
        "last_name": "Cheng",
        "email": "kevinzifancheng@gmail.com",
        "password": "good",
        "password_confirmation": "good",
      )
      test_user.save
      expect(test_user.errors.full_messages).to include("First name can't be blank")
    end

    it "is invalid if last name is missing" do
      test_user = User.new(
        "first_name": "Kevin",
        "email": "kevinzifancheng@gmail.com",
        "password": "good",
        "password_confirmation": "good",
      )
      test_user.save
      expect(test_user.errors.full_messages).to include("Last name can't be blank")
    end

    describe "Password" do
      it "is invalid if password is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password_confirmation": "good",
        )
        test_user.save
        expect(test_user.errors.full_messages).to include("Password can't be blank")
      end

      it "is invalid if password_confirmation is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
        )
        test_user.save
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
        test_user.save
        expect(test_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "is invalid if passwords are too short" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "a",
          "password_confirmation": "a",
        )
        test_user.save
        expect(test_user.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
      end
    end

    describe "Email" do
      it "is invalid if email is missing" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "password": "good",
          "password_confirmation": "good",
        )
        test_user.save
        expect(test_user.errors.full_messages).to include("Email can't be blank")
      end

      it "is invalid if email is not unique" do
        test_user = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
          "password_confirmation": "good",
        )
        test_user2 = User.new(
          "first_name": "Kevin",
          "last_name": "Cheng",
          "email": "kevinzifancheng@gmail.com",
          "password": "good",
          "password_confirmation": "good",
        )
        test_user.save
        expect(test_user.errors.full_messages).to be_empty

        test_user2.save
        expect(test_user2.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end

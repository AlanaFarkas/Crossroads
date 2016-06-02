require 'rails_helper'

describe User do
  let(:user){User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})}
  let(:user_2){User.create({first_name: "test", last_name: "test", email: "test-sdvc23est.com", phone_number: "1231231123", password: "Testing"})}
  let(:user_3){User.new}

  context "Validations" do
    describe "first_name" do
      it "is not valid if nil" do
        user_3.valid?
        expect(user_3.errors[:first_name]).to_not be_empty
      end
      it "is valid if not nil" do
        user.valid?
        expect(user.errors[:first_name]).to be_empty
      end
    end
    describe "last_name" do
      it "is not valid if nil" do
        user_3.valid?
        expect(user_3.errors[:last_name]).to_not be_empty
      end
      it "is valid if not nil" do
        user.valid?
        expect(user.errors[:last_name]).to be_empty
      end
    end
    describe "email" do
      it "is not valid if nil" do
        user_3.valid?
        expect(user_3.errors[:email]).to_not be_empty
      end
      it "is valid if not nil" do
        user.valid?
        expect(user.errors[:email]).to be_empty
      end
      it "is not valid if not in proper email format" do
        user_2.valid?
        expect(user_2.errors[:email]).to_not be_empty
      end
      it "is valid if in proper email format" do
        user.valid?
        expect(user.errors[:email]).to be_empty
      end
      it "is not valid if not unique" do
        user
        user_4 = User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})
        expect(user_4.errors[:email]).to include("has already been taken")
      end
    end
  end
end

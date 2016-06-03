require 'rails_helper'
#All Validation and Association Tests Complete
describe User do
  let(:user){User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})}
  let(:user_2){User.create({first_name: "test", last_name: "test", email: "test-sdvc23est.com", phone_number: "1231231123", password: "Testing"})}
  let(:user_3){User.new}
  let(:address){Address.create({address_1: "test", city: "test", state: "test", zip: "12345"})}
  let(:favorite){Favorite.create()}
  let(:establishment){Establishment.create({name: "test", address_1: "test", city: "test", state: "test", zip: "12345"})}

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

    describe "password" do
      it "is not valid when nil" do
        user_3.valid?
        expect(user_3.errors[:password]).to_not be_empty
      end
      it "is valid when not nil" do
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
      it "is not valid if less than 6 characters" do
        user.password = "Test1"
        user.valid?
        expect(user.errors[:password]).to include("must be at least 6 characters")
      end
      it "is not valid if more than 25 characters" do
        user.password = "Test1123409876543210987654321098"
        user.valid?
        expect(user.errors[:password]).to include("cannot be over 25 characters")
      end
      it "is not valid if it does not contain a capital letter and a digit" do
        user.password = "testing"
        user.valid?
        expect(user.errors[:password]).to include("must contain at least one capital letter and a digit")
      end
      it "is valid if it is between 6 to 25 characters and includes a capital letter and a digit" do
        user.valid?
        expect(user.errors[:password]).to be_empty
      end
    end
  end

  context "Associations" do
    describe "#addresses" do
      it "returns an array of addresses if it has one or more" do
        user.addresses << address
        expect(user.addresses).to eq([address])
      end
      it "returns an empty array if it has no adresses" do
        expect(user.addresses).to eq([])
      end
    end
    describe "#favorites" do
      it "returns an array of favorites if it has one or more" do
        user.favorites << favorite
        expect(user.favorites).to eq([favorite])
      end
      it "returns an empty array if it has none" do
        expect(user.favorites).to eq([])
      end
    end
    describe "#favorites#establishment" do
      it "returns a favorite establishment if it has one" do
        user.favorited_establishments << establishment
        expect(user.favorited_establishments).to eq([establishment])
      end
      it "returns an empty array if it doesn't have one" do
        expect(user.favorited_establishments).to eq([])
      end
    end
  end

  # context "methods" do

  # end
end

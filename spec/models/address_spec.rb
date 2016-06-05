require 'rails_helper'

describe Address do
  let(:address){Address.create({address_1: "test", city: "test", state: "test", zip: "12345"})}
  let(:address_2){Address.new}
  let(:user){User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})}
  context "Validations" do
    describe "address_1" do
      it "is not valid when nil" do
        address_2.valid?
        expect(address_2.errors[:address_1]).to_not be_empty
      end
      it "is valid when not nil" do
        address.valid?
        expect(address.errors[:address_1]).to be_empty
      end
    end
    describe "city" do
      it "is not valid when nil" do
        address_2.valid?
        expect(address_2.errors[:city]).to_not be_empty
      end
      it "is valid when not nil" do
        address.valid?
        expect(address.errors[:city]).to be_empty
      end
    end
    describe "state" do
      it "is not valid when nil" do
        address_2.valid?
        expect(address_2.errors[:state]).to_not be_empty
      end
      it "is valid when not nil" do
        address.valid?
        expect(address.errors[:state]).to be_empty
      end
    end
    describe "zip" do
      it "is not valid when nil" do
        address_2.valid?
        expect(address_2.errors[:zip]).to_not be_empty
      end
      it "is valid when not nil" do
        address.valid?
        expect(address.errors[:zip]).to be_empty
      end
    end
  end
  context "Associations" do
    describe "user" do
      it "returns the user if it has one" do
        user.addresses << address
        expect(address.user).to eq(user)
      end
      it "returns nil if it doesn't have one" do
        expect(address.user).to eq(nil)
      end
    end
  end
  context "Methods" do
    describe "#full_address" do
      it "interpolates the addresses fields into one string" do
        expect(address.full_address).to eq("test test test 12345")
      end
    end
  end
end

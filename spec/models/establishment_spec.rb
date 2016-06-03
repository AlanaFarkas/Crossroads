require 'rails_helper'
#All Validation And Association Test Complete
describe Establishment do
  let(:establishment){Establishment.create({name: "test", address_1: "test", city: "test", state: "test", zip: "12345"})}
  let(:establishment_2){Establishment.new}
  let(:favorite){Favorite.create()}
  context "Validations" do
    describe "name" do
      it "is not valid if nil" do
        establishment_2.valid?
        expect(establishment_2.errors[:name]).to_not be_empty
      end
      it "is valid if not nil" do
        establishment.valid?
        expect(establishment.errors[:name]).to be_empty
      end
    end
    describe "address_1" do
      it "is not valid if nil" do
        establishment_2.valid?
        expect(establishment_2.errors[:address_1]).to_not be_empty
      end
      it "is valid if not nil" do
        establishment.valid?
        expect(establishment.errors[:address_1]).to be_empty
      end
    end
    describe "city" do
      it "is not valid if nil" do
        establishment_2.valid?
        expect(establishment_2.errors[:city]).to_not be_empty
      end
      it "is valid if not nil" do
        establishment.valid?
        expect(establishment.errors[:city]).to be_empty
      end
    end
    describe "state" do
      it "is not valid if nil" do
        establishment_2.valid?
        expect(establishment_2.errors[:state]).to_not be_empty
      end
      it "is valid if not nil" do
        establishment.valid?
        expect(establishment.errors[:state]).to be_empty
      end
    end
    describe "zip" do
      it "is not valid if nil" do
        establishment_2.valid?
        expect(establishment_2.errors[:zip]).to_not be_empty
      end
      it "is valid if not nil" do
        establishment.valid?
        expect(establishment.errors[:zip]).to be_empty
      end
    end
  end
  context "Associations" do
    describe "favorites" do
      it "returns an array of favorites if it has them" do
        establishment.favorites << favorite
        expect(establishment.favorites).to eq([favorite])
      end
      it "returns an empty array if it has none" do
        expect(establishment.favorites).to eq([])
      end
    end
  end
end


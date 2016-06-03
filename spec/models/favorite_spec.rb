require 'rails_helper'

describe Favorite do
  let(:user){User.create({first_name: "test", last_name: "test", email: "test@test.com", phone_number: "1231231123", password: "Testing1"})}
  let(:establishment){Establishment.create({name: "test", address_1: "test", city: "test", state: "test", zip: "12345"})}
  let(:favorite){Favorite.create()}
  context "Associations" do
    describe "user" do
      it "returns the user that favorited it" do
        user.favorites << favorite
        expect(favorite.user).to eq(user)
      end
      it "returns nil if it has no user" do
        expect(favorite.user).to eq(nil)
      end
    end
    describe "establishment" do
      it "returns the establishment that is the favorite" do
        establishment.favorites << favorite
        expect(favorite.establishment).to eq(establishment)
      end
      it "returns nil if it has no user" do
        expect(favorite.establishment).to eq(nil)
      end
    end
  end
end

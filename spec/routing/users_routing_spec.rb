require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/users/1").to route_to("users#show", id: "1")
    end
    it "routes to sessions#new" do
      expect(:get => "/login").to route_to("devise/sessions#new")
    end
    it "routes to sessions#destroy" do
      expect(:get => "/logout").to route_to("devise/sessions#destroy")
    end
  end
end
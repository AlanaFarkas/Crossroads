require "rails_helper"

RSpec.describe FavoritesController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/favorites").to route_to("favorites#index")
    end
  end
end
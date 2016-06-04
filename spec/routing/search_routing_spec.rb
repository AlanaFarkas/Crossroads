require "rails_helper"

RSpec.describe SearchController, :type => :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/search").to route_to("search#new")
    end
    it "routes to #create" do
      expect(:post => "/search").to route_to("search#create")
    end
    it "routes to #show" do
      expect(:get => "/search/show").to route_to("search#show")
    end
  end
end
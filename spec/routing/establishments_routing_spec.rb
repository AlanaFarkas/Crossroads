require "rails_helper"

RSpec.describe EstablishmentsController, :type => :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/establishments/1").to route_to("establishments#show", id: "1")
    end
  end
end
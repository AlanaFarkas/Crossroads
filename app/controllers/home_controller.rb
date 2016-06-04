class HomeController < ApplicationController

  def index
    @api_key = ENV["GOOGLE_MAP_API_KEY"]
  end
end

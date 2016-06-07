class SearchController < ApplicationController

  def show
    @api_key = ENV["GOOGLE_MAP_API_KEY"]
  end
end

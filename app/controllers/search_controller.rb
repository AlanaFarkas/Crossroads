class SearchController < ApplicationController

  def new
  end

  def create
    redirect_to search_show_path
  end

  def show

    @api_key = ENV["GOOGLE_MAP_API_KEY"]
  end
end

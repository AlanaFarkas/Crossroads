class SearchController < ApplicationController

  def new
  end

  def create
    @api_key = ENV["GOOGLE_MAP_API_KEY"]
    @address1 = params[:search][:address_1]
    render :show
  end

  def show
  end
end

class EstablishmentsController < ApplicationController

  def show
    @establishment = Establishment.find_by(id: params[:id])
  end

end
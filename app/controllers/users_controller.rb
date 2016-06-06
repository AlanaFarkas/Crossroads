class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      @addresses = @user.addresses
    else
      redirect_to root_path
    end
  end
end

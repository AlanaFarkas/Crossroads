class Users::SessionsController < Devise::SessionsController
before_action :configure_sign_in_params, only: [:create]
before_action :authenticate_user!, only:[:create]
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
        binding.pry
      @user = User.find_by(email: params[:email])
      if @user
        redirect_to user_path
      else
        render "login"
      end

  end

  # DELETE /resource/sign_out
  def destroy
    super
    render "login"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end

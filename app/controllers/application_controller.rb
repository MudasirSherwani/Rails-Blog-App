class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :update_allowed_parameters, if: :devise_controller?
  # protected
  # def update_allowed_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end

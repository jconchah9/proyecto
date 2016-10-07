class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_agro!
    redirect_to root_path unless user_signed_in? && current_user.agro?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :rut])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :rut])
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :danger, :warning
  before_action :validate_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :remember_me, :password) }
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def validate_user
    unless user_signed_in?
      redirect_to(new_user_session_path, alert: "You must be logged in to access this page") unless request.env['PATH_INFO'].eql?(new_user_session_path)
    end
  end

end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  protected

  def configure_permitted_parameters
    added_attrs = [:phonenumber, :email, :password, :password_confirmation, :username, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end
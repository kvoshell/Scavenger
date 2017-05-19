class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # Validation toggle for testing
  # before_action :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseHelper

  protected

  # Enable Username functionality
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # Redirect for landing page
  def after_sign_in_path_for(resource)
  topics_path
  end

  private

  # Toggle authentication for testing
  # def authenticate_user!
  #   super unless $disable_authentication
  # end
end

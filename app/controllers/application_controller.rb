class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configuration_permitted_parameters, if: :devise_controller?

  protected

  def configuration_permitted_parameters
    devise_parameters_sanitizer.for(:sign_up) << :username
    devise_parameters_sanitizer.for(:account_update) << :username
  end
end

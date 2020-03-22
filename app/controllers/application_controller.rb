class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protect_from_forgery prepend: true

  protected

  include MarkdownHelper

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || lists_path
  end
end

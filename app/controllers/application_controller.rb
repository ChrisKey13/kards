class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include MarkdownHelper
   protect_from_forgery prepend: true



   def after_sign_in_path_for(resource)
     stored_location_for(resource) || lists_path
   end
end

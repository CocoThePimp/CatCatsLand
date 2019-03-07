class ApplicationController < ActionController::Base
  helper_method :signed_in?, :is_admin?
  include ProfilesHelper
end

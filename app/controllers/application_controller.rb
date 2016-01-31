require 'angular_csrf_protection'

class ApplicationController < ActionController::Base

  include AngularCsrfProtection

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  def current_user
    @current_user ||= User.find_by(uuid: session[:user_uuid]) if session[:user_uuid]
  end

  helper_method :current_user

  def authorize
    redirect_to hornburg_approach_path unless current_user
  end

end

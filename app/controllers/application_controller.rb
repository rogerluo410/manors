require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:email, :password, :password_confirmation, roles: []) }
  end

  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

  private
 
  def record_not_found
    #render plain: "404 Not Found", status: 404
    redirect_to '/post', :alert =>"Resource Not Found!"
  end

end

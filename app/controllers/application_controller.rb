class ApplicationController < ActionController::Base
  before_action :basic, if: :production?
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def production?
    Rails.env.production?
  end
  
  def basic
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end

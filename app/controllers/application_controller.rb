class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  skip_before_action :verify_authenticity_token

  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end

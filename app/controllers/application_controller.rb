class ApplicationController < ActionController::Base
  include Presenters

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Strong params on sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username name bio website avatar])
    # Strong params on Account update
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name bio website avatar])
  end
end

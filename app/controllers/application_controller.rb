# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_registration_params, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end

  def configure_registration_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name])
  end
end

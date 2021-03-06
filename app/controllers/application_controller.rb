# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username bio email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username fake_username bio email password password_confirmation
                                               current_password])
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end

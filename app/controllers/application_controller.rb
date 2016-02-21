class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to user_path(current_user), alert: permission_denied_message
  end

  protected

  def permission_denied_message
    "Sorry, you do not have the permissions for that."
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end

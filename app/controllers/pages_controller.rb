class PagesController < ApplicationController
  def index
    redirect_to user_path(current_user) if current_user.present?
  end
end

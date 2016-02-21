class UsersController < ApplicationController

  def show
    @user = current_user
    @lists = @user.lists.all
  end
end
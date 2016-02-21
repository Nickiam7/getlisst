class UsersController < ApplicationController

  def show
    @lists = current_user.lists.all
  end
end
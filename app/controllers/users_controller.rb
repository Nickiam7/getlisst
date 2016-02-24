class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    @collab_lists = @user.collaborations
    authorize @user
  end
end
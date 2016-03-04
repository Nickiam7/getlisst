class UsersController < ApplicationController

  def index
    @users = User.order(:username).where("username like ?", "%#{params[:term]}%") - [current_user]
    render json: @users.map{ |user| "#{user.username} - #{user.email}"}
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    @collab_lists = @user.collaborations
    authorize @user
  end

end
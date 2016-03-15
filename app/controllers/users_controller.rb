class UsersController < ApplicationController

  def index
    @users = User.order(:username).where("username like ?", "%#{params[:term]}%") - [current_user]
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists
    @collab_lists = @user.collaborations
    authorize @user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
    else
      flash[:error] = "Invalid user information"
    end
    redirect_to edit_user_registration_path
  end

  private
  def user_params
    params.require(:user).permit(:user_photo)
  end

end
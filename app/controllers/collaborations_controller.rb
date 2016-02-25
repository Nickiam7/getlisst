class CollaborationsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @user = User.find_by(username: params[:username])
    if @user == nil
      flash[:notice] = "The user you tried to add can't be found"
    else
      @collaboration = @list.collaborations.create(user: @user)
      if @collaboration.persisted?
        flash[:notice] = "\"#{@user.username}\" can now access your list!"
      else
        flash[:notice] = "Sorry, Something went wrong"
      end
    end
      redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @user = User.find_by(username: params[:username])
    @collaboration = @list.collaborations.find(params[:id])
    if @collaboration.destroy
      flash[:notice] = "User can no longer access your list"
    else
      flash[:notice] = "Sorry, Something went wrong"
    end
    redirect_to list_path(@list)
  end
end

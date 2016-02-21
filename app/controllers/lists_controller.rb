class ListsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:notice] = "\"#{@list.title}\" has been created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Sorry, something went wrong"
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :category, :completion_date)
  end
end

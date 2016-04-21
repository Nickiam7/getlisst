class ListsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      flash[:notice] = "\"#{@list.title}\" has been created"
      redirect_to list_path(@list)
    else
      flash[:alert] = "Sorry, something went wrong"
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
    @collaboration = Collaboration.new
    @items = @list.items.all
    authorize @list
  end

  def destroy
    @list = List.find(params[:id])
    if @list.delete
      flash[:notice] = "Your list has been deleted"
    else
      flash[:notice] = "Something went wrong"
    end
      redirect_to user_path(current_user)
  end

  private
  def list_params
    params.require(:list).permit(:title, :description, :category, :completion_date)
  end
end

class ItemsController < ApplicationController

  def create
    @list = current_user.lists.find(params[:list_id])
    @item = current_user.items.new(item_params)
    @item.list = @list
    if @item.save
      flash.now[:notice] = "Items was successfully added"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item_subtasks = @item.subtasks
    @user = @item.list.user
    authorize @item
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    @item.update(item_params)
    flash[:notice] = "Success"
    redirect_to list_item_path(@list, @item)
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.delete
      flash[:notice] = "Item has been deleted"
    else
      flash[:notice] = "Item has been deleted"
    end
      redirect_to list_path(@list)
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, subtasks_attributes: [:id, :name, :description, :_destroy])
  end
end

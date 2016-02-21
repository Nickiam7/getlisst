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

  private
  def item_params
    params.require(:item).permit(:title, :description)
  end
end

class ItemsController < ApplicationController
  
  respond_to :html, :js

  def create
    @list = current_user.list
    @items = @list.items

    @item = @list.items.build(item_params)
    @new_item = Item.new
  
    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "There was an error saving the Item. Please try again"
    end

    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
  end
  
  def destroy
    @list = current_user.list
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Congrats on Finishing the item!"
    else
      flash[:error] = "Couldnt mark the item as completed"
    end
 
    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
    

  end
  
  
  private 

  def item_params
    params.require(:item).permit(:name)
  end
  
end
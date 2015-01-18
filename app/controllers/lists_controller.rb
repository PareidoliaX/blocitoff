class ListsController < ApplicationController
  # before_action :authenticate_user!
  
  def show
    @list = current_user.list
  end
  
  def edit
    @list = current_user.list
  end
  
  def update
    @list = current_user.list
    @list.update_attributes(list_params)
    redirect_to @list
  end
  
  private

  def list_params
    params.require(:list).permit(:title)
  end
  
end
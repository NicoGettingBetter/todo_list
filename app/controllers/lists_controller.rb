class ListsController < ApplicationController
  def create
  	@list = current_user.lists.new params.require(:list).permit(:name)
  	if @list.save
  		redirect_to root_path
  	end
  end

  def destroy
  	list = List.find params[:id]
  	for task in list.tasks do
  	  	task.destroy
  	end
  	list.destroy
  	redirect_to root_path
  end
end
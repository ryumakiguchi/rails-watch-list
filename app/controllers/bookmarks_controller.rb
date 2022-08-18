class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.new
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path(@list), status: :see_other
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :address, :phone_number, :category)
  end
end

class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new()
  end

  def show
    @list = List.find(params["id"])
    @bookmark = Bookmark.new(list: @list)
  end

  def new
  end

  def create
    @list = List.new(lists_params)
    @list.save
    redirect_to lists_path
  end

  private

  def lists_params
    params.require(:list).permit(:name)
  end
end

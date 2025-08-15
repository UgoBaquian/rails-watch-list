class BookmarksController < ApplicationController

  def new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    list = List.find(params["list_id"])
    @bookmark.list = list
    @bookmark.save
    redirect_to list_path(list)
  end

  def destroy
    @bookmark = Bookmark.find(params["list_id"])
    @bookmark.destroy
    redirect_to list_path(params["list_id"])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

class BookmarkController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmark.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Your bookmark was saved!"
      redirect_to bookmarks_path
    else
      flash.now[:alert] = "Uh-oh!  Your bookmark could not be saved!"
      render :new
    end
  end

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end

  def edit
  end
end

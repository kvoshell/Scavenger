class BookmarksController < ApplicationController

  before_action :require_sign_in

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmarks = Bookmark.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    @bookmark.title = params[:bookmark][:title]
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      flash[:notice] = "Your bookmark was saved!"
      redirect_to topic_path(@topic.id)
    else
      flash.now[:alert] = "Uh-oh!  Your bookmark could not be saved!"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated!"
      redirect_to topic_path(@topic.id)
    else
      flash[:alert] = "Error updating Bookmark."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.title}\" was deleted successfully."
      redirect_to topic_path(@topic.id)
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      redirect_to topic_path(@topic.topic_id)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end
end

class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.build(bookmark: @bookmark)
     authorize like

     if like.save
       flash[:notice] = "Bookmark liked!"
       redirect_to @topic
     else
       flash[:alert] = "Action Canceled!"
       redirect_to @topic
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.find(params[:id])
     authorize like

     if like.destroy
       flash[:notice] = "Bookmark Unliked!"
       redirect_to @topic
     else
       flash[:alert] = "Action Canceled!"
       redirect_to @topic
     end
   end
end

class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
    @topic_count = Topic.count
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.id = params[:topic][:id]

    if @topic.save
      flash[:notice] = "Your topic was saved!"
      redirect_to topics_path
    else
      flash.now[:alert] = "Uh-oh!  Your topic could not be saved!"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "Deleted #{@topic.title}."
      redirect_to action: :index
    else
      flash.now[:alert] = "Unable to delete #{@topic.title}."
      render :show
    end
  end
end

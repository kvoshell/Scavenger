class TopicsController < ApplicationController

  before_action :authenticate_user!

  def create #THIS NEEDS WORK, REDIRECT AND SAVING
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    # @topic.body = params[:topic][:body]
    @topic.id = params[:topic][:id]

    if @topic.save
      flash[:notice] = "Your topic was saved!"
      redirect_to @topic
    else
      flash.now[:alert] = "Uh-oh!  Your topic could not be saved!"
      render :new
    end
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
  end
end

class TopicsController < ApplicationController

  before_action :authenticate_user!


  def index
    @topics = Topic.all

  end

  def show
    @topic = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
  end
end

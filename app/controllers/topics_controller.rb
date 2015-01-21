class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 5)
    # The array returned here is an array of collections
    # Get total num of pages from array count
    @total_pages = @topics.count
    # Get the starting page
    @first_page = @topics[1]
    # Generate hash to send to will_paginate helper method
    @paginate_hash = { total: pages: @total_pages, first_page: @first_page }
    # @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    # @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end
  
  def create
     @topic = Topic.new(topics_params)
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(topics_params)
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again"
       render :edit
     end
   end
  
  private
  
  def topics_params
    params.require(:topic).permit(:name, :description, :public)
  end
  
end

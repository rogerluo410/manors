class PostController < ApplicationController

  def index
    @posts = Post.all
    #render :text => 'success' , :status => 200 
  end

  def create
    @post = Post.new
    @post.content = params[:post][:content] if params[:post][:content].present?
    @post.author_id = params[:post][:author_id] if params[:post][:author_id].present?
    @post.publish_time = Time.now

    if @post.save
      redirect_to '/post', :alert => 'Create successfully.'
    else
      redirect_to '/post', :alert => @post.errors.full_messages.join(',')
    end

  end

  def new
    @post = Post.new
  end

end

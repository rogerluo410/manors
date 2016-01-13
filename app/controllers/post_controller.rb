class PostController < ApplicationController

  def index
    @posts = Post.all
    #render :text => 'success' , :status => 200 
  end

  def create
    @post = Post.new
    @post.content = params[:content] if params[:content].present?
    @post.author_id = params[:author_id] if params[:author_id].present?
    @post.publish_time = Time.now

    if @post.save
      redirect_to '/posts', :alert => 'Create successfully.'
    else
      redirect_to '/posts', :alert => @post.errors.full_messages.join(',')
    end

  end

end

class ReplyController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post.replys.build(content: params[:content].presence, author_id: params[:author_id].presence)
    if @post.save
      redirect_to '/post/#{params[:post_id]}/reply', :alert => 'Create successfully.'
    else
      redirect_to '/post/#{params[:post_id]}/reply', :alert => @post.errors.full_messages.join(',')
    end
  end

  def show

  end

  def new
    @reply = Reply.new
  end
end

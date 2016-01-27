class ReplyController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @reply = Reply.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.replys.build({content: params[:reply][:content].presence, author_id: params[:reply][:author_id].presence})
    if @post.save
      @reply = Reply.new
      render 'index'
      #redirect_to action: 'index'
    else
      #redirect_to '/post/#{@post.id}/reply', :alert => @post.errors.full_messages.join(',')
      @reply = Reply.new
      render 'index'
    end
  end

  def show

  end

  def new
    @post = Post.find(params[:post_id])
    @reply = Reply.new
  end
end

class ReplyController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @post = Post.find(params[:post_id])
    @reply = Reply.new
    @post.set_post_meta("views")
  end

  def create
    @post = Post.find(params[:post_id])
    @post.replys.build({content: params[:reply][:content].presence, author_id: params[:reply][:author_id].presence})
    if @post.save
      @post.set_post_meta("replys")
      redirect_to "/post/#{@post.id.to_s}/reply", :notice => "回复成功"
    else
      redirect_to "/post/#{@post.id.to_s}/reply", :alert => @post.errors.full_messages.join(',')
    end
  end

  def show

  end

  def new
    @post = Post.find(params[:post_id])
    @reply = Reply.new
  end
end

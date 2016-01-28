class PostController < ApplicationController

  def index
    @posts = Post.all
    #render :text => 'success' , :status => 200 
  end

  def create
    @post = Post.new
    @post.content = post_params[:content]
    post_params[:avatars].each do | avatar |
      @post.images.build(avatar: avatar)
    end
    #@post.author_id = params[:post][:author_id]

    if @post.save
      redirect_to '/post', :alert => 'Create successfully.'
    else
      redirect_to '/post', :alert => @post.errors.full_messages.join(',')
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:content, {avatars: []}) # allow nested params as array
  end

end

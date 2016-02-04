class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @post = Post.new
    @post.content = post_params[:content]
    post_params[:avatars].each do | avatar |
      @post.images.build(avatar: avatar)
    end if post_params[:avatars].present?
    #@post.author_id = params[:post][:author_id]

    if @post.save
      @post.initialize_post_meta
      redirect_to '/post', :notice => 'Create successfully.'
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

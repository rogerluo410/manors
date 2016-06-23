class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => Post::PER_PAGE)
  end

  def create
    current_user.posts.build(
        content: post_params[:content]
      ).tap do | post |
        post_params[:avatars].each do | avatar |
            post.images.build(avatar: avatar)
          end if post_params[:avatars].present?
    end

    if current_user.save
      redirect_to '/post', :notice => 'Create successfully.'
    else
      redirect_to '/post', :alert => @post.errors.full_messages.join(',')
    end
  end

  def new
    @post = Post.new
  end

  def search
    @posts = Post.full_text_search(params[:search_input])
    @posts = @posts.paginate(:page => params[:page], :per_page => Post::PER_PAGE)
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:content, {avatars: []}) # allow nested params as array
  end

end

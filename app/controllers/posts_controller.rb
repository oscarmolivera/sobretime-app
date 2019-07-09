class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]
  before_action :authenticate_user!
  def index
    @post = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id= current_user.id
    if @post.save 
      redirect_to @post 
    else
      render :new
    end
  end

  def edit;  end
  
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_post_path(@post)
    end
  end

  def show;  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale)
    end
    def set_post
      @post = Post.find(params[:id])
    end
  
end

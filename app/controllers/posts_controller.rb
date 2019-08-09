class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy approve]
  before_action :authenticate_user!
  def index
    @post = Post.posts_by(current_user).page(params[:page]).per(15)
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

  def edit
    authorize @post
  end
  
  def update
    authorize @post
    
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_post_path(@post)
    end
  end

  def show; end
  
  def destroy 
    @post.delete
    redirect_to @post
  end

  def approve
    authorize @post
    @post.aprobado!
    redirect_to root_path, notice: "Horas aprobadas con éxito"
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end
    def set_post
      @post = Post.find(params[:id])
    end
  
end

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(params_post)
    if @post.save
      # redirect to article list
      redirect_to posts_path
    else
      # push button or rollback
      render 'new'
    end
  end

  private

  def params_post
    params.require(:post).permit(:title, :body)
  end
end

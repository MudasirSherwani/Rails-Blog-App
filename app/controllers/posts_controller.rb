class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = @user.posts.order(created_at: :desc)
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = 'Error Occur During Post Create !'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def show
    user_id = params[:user_id]
    post_id = params[:id]
    @user = User.find(user_id)
    @post = @user.posts.find(post_id)
    @comments = @post.comments.order(created_at: :desc)
    @likes = @post.likes.all
  end
end

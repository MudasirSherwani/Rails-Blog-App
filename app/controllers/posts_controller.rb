class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:comments]).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    redirect_to user_post_path(@user, @post) if params[:post_number]
    @post_number = @user.posts.find_index(@post) + 1
    @like = @post.likes.find_by(author: current_user)
  rescue ActiveRecord::RecordNotFound
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  before_action :set_user

  def create
    like = Like.new(author_id: params[:user_id], posts_id: params[:post_id])
    if like.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Post was successfully liked.'
    else
      flash.now[:error] = 'Error Occurred During Like Creation!'
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    @user.update(post_counter: @user.post_counter - 1)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post Deleted successfully.' }
      format.json { head :no_content }
    end
  end

  def likes
    @post = Post.find(params[:id])
    if @post.likes.create(author_id: current_user.id)
      flash[:success] = 'Post Liked'
    else
      flash[:error] = 'Failed to like the post.'
    end
    redirect_to user_posts_path
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.includes([:posts]).find(user_id)
    @posts = @user.posts.includes([:comments]).order(created_at: :desc)
  end

  def create
    if @user.id != current_user.id
      flash[:alert] = 'You do not have permission to add post'
      redirect_to root_path and return
    end
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

  def destroy
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    @user.update(posts_counter: @user.posts_counter - 1)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Post Deleted successfully.' }
      format.json { head :no_content }
    end
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

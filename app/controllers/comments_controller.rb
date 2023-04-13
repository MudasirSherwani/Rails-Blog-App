class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    if @user.id != current_user.id
      flash[:alert] = 'You do not have permission to add comment'
      redirect_to root_path and return
    end
    @comment.posts = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id])
    else
      flash[:alert] = 'Error occur during add Comment!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_post_path(@post), notice: 'Comment deleted successfully.' }
      format.json { head :no_content }
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

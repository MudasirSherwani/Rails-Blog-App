class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    pst = Post.find(params[:post_id])
    comm = pst.comments
    render json: comm
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = User.find(params[:user_id])
    @comment.posts = Post.find(params[:post_id])
    if @comment.save
      render json: { status: 'Success', data: @comment }
    else
      render json: { status: 'Failure', error: @comment.errors.full_messages }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

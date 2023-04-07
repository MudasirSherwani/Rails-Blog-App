class CommentsController < ApplicationController
    def new
      @comment = Comment.new
      @post = Post.find(params[:post_id])
    end
  
    def create
      @comment = Comment.new(comment_params)
      @comment.author = current_user
      @comment.posts = Post.find(params[:post_id])
      if @comment.save
        redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id])
      else
        flash[:alert] = "Error occur during add Comment!"
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
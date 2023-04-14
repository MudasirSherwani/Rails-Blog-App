class LikesController < ApplicationController
  def create
    like = Like.new(author_id: params[:user_id], posts_id: params[:post_id])
    if like.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Post was successfully liked.'
    else
      flash.now[:error] = 'Error Occurred During Like Creation!'
    end
  end
end

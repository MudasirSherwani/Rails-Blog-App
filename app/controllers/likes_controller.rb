class LikesController < ApplicationController
  def create
    author = params[:user_id]
    post = params[:post_id]
    like = Like.new(author_id: author, posts_id: post)

    if like.save
      redirect_to user_post_path(author, post)
    else
      flash.now[:error] = 'Error Occur During Like Create !'
    end
  end
end

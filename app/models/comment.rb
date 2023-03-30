class Comment < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'users_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'posts_id'

  def update_comment_counter
    posts.increment!(:comment_counter)
  end
end
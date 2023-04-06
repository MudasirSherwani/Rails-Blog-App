class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'posts_id'

  def update_comment_counter
    posts.increment!(:comment_counter)
  end
end

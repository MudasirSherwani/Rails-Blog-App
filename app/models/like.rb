class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'posts_id'

  after_save :update_like_counter
  def update_like_counter
    posts.increment!(:like_counter)
  end
end

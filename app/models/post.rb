class Post < ApplicationRecord
  has_many :comments, foreign_key: 'posts_id'
  has_many :likes, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_posts_counter
    author.increment!(:post_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

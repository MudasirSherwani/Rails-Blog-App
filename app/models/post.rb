class Post < ApplicationRecord
  has_many :comments, foreign_key: 'posts_id'
  has_many :likes, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  def update_posts_counter
    author.increment!(:post_counter)
  end

  def most_recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end
end

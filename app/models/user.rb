class User < ApplicationRecord
  has_many :likes, foreign_key: 'users_id'
  has_many :comments, foreign_key: 'users_id'
  has_many :posts, foreign_key: 'author_id'
end

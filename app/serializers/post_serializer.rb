class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comment_counter, :like_counter
  has_many :comments
end

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(id: 1, name: 'John Doe') }
  let(:post) { Post.create(id: 1, title: 'My Post', author_id: user.id) }
  subject { Like.new(author_id: user.id, posts_id: post.id) }

  describe 'validations' do
    it 'requires a user' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end

    it 'requires a post' do
      subject.posts_id = nil
      expect(subject).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'My Post', author: user) }
  subject { Like.new(users: user, posts: post) }

  describe 'validations' do
    it 'requires a user' do
      subject.users = nil
      expect(subject).to_not be_valid
    end

    it 'requires a post' do
      subject.posts = nil
      expect(subject).to_not be_valid
    end
  end
end

require 'rails_helper'
RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Mudasir', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full-stack developer') }
  let(:post) { Post.create(title: 'My Post', author: user) }
  subject { Comment.new(text: 'comment is Lorem ipsum', users_id: user.id, posts_id: post.id) }

  before { subject.save }

  it 'should belong to a user' do
    expect(subject.users_id).to eq(user.id)
  end

  it 'should belong to a post' do
    expect(subject.posts_id).to eq(post.id)
  end

  it 'should not be valid without a body' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
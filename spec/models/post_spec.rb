require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My post title', text: 'Lorem ipsum dolor sit amet', comment_counter: 5, like_counter: 10) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title should not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments Counter must be integer' do
    subject.comment_counter = 'test'
    expect(subject).to_not be_valid
  end

  it 'Comments Counter must be 0 or greater' do
    subject.comment_counter = -5
    expect(subject).to_not be_valid
  end

  it 'Likes Counter must be integer' do
    subject.like_counter = 'test'
    expect(subject).to_not be_valid
  end

  it 'Likes Counter must be 0 or greater' do
    subject.like_counter = -5
    expect(subject).to_not be_valid
  end
end

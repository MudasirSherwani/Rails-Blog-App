require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mudasir', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 8, bio: 'Full-stack developer') }

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be integer' do
    subject.post_counter = 'mudasir'
    expect(subject).to_not be_valid
  end

  it 'Post Counter must be 0 or greater' do
    subject.post_counter = -5
    expect(subject).to_not be_valid
  end
end
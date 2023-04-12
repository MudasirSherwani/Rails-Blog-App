require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users Show', type: :feature do
  before(:example) do
    @user = User.create(id: 1, name: 'Tom', post_counter: 5,
                photo: '',
                bio: 'A Full Stack Developer')
    Post.create(title: 'Post 1 by Tom', text: 'This post is written by tom', comment_counter: 0, like_counter: 0,
      author: @user)
    Post.create(title: 'Post 2 by Tom', text: 'This post is written by tom', comment_counter: 0, like_counter: 0,
      author: @user)
    Post.create(title: 'Post 3 by Tom', text: 'This post is written by tom', comment_counter: 0, like_counter: 0,
      author: @user)
    Post.create(title: 'Post 4 by Tom', text: 'This post is written by tom', comment_counter: 0, like_counter: 0,
      author: @user)
    Post.create(title: 'Post 5 by Tom', text: 'This post is written by tom', comment_counter: 0, like_counter: 0,
      author: @user)
      visit users_path(@user.id)
  end

  it "redirect to that user's show page after click" do
    click_link @user.name
    expect(page).to have_current_path(user_path(@user.id))
  end
  it 'renders the name of the user' do
    expect(page.body).to include('Tom')
  end
  it 'renders the bio of the user' do
    expect(page.body).to include('A Full Stack Developer')
  end
  it 'renders the number of posts of the user' do
    expect(page.body).to include('5')
  end
  it 'renders the profile picture of the user' do
    expect(page.body).to include('img')
  end
  it "renders the first 3 of title of the user's posts" do
    expect(page.body).to include('See all posts')
  end
  it 'there is button to see all posts' do
    expect(page.body).to include('See all posts')
  end
end

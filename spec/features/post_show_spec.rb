require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Post Show', type: :request do
  subject { page }
  before(:each) do
    @user1 = User.create(id: 1, name: 'Mudasir Sherwani', post_counter: 5, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am Mudasir Sherwani the full stack developer')
    @post1 = Post.create(id: 1, title: 'Post #1', text: 'This is my first post', comment_counter: 0,
                like_counter: 0, author_id: @user1.id)
    @like = Like.create(author_id: @user1.id, posts_id: @post1.id)
  end
  it 'renders the title of the post' do
    get user_posts_path(1)
    expect(response.body).to include('Post #1')
  end
  it 'renders the picture of the user' do
    get user_posts_path(1)
    expect(response.body).to include('img')
  end
  it 'renders the number of likes of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end
  it 'renders the number of comments of the post' do
    get user_posts_path(1)
    expect(response.body).to include('0')
  end
  it 'renders the text of the post' do
    get user_posts_path(1)
    expect(response.body).to include('This is my first post')
  end
end

RSpec.describe 'Post show page', type: :feature do
    before do
      @user = User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        post_counter: 1
      )
  
      @post = Post.create(
        title: 'Post #1',
        text: 'This is my first post',
        comment_counter: 3,
        like_counter: 4,
        author_id: @user.id
      )
  
      @first_comment = Comment.create(
        posts_id: @post.id,
        author_id: @user.id,
        text: 'Good Post by tom'
      )
  
      @like = Like.create(author_id: @user.id, posts_id: @post.id)
      visit user_post_path(@user, @post)
    end

    it "displays who wrote the post" do
        visit user_post_path(@user, @post)
        expect(page).to have_content(@user.name)
      end

      it "displays each commentor's user" do
        visit user_post_path(@user, @post)
        @post.comments.each do |comment|
          expect(page).to have_content(comment.author.name)
        end
      end

    end

require_relative '../rails_helper'

RSpec.describe 'PostsController', type: :request do
  subject { page }
  before(:each) do
    User.create(id: 1, name: 'Mudasir Sherwani', post_counter: 5, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                bio: 'I am Mudasir Sherwani the full stack developer')
    Post.create(id: 12, title: 'Post by Sherwani', text: 'This is my first post', comment_counter: 0,
                like_counter: 0, author_id: 1)
    Like.create(author_id: 1, posts_id: 12)
  end
  describe 'GET #index' do
    before(:example) { get user_posts_path(user_id: 1) }

    it 'Should returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should renders index template' do
      expect(response).to render_template('index')
    end

    it 'Should response post title text' do
      expect(response.body).to include('Post by Sherwani')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(user_id: 1, id: 12) }

    it 'Should returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should renders show template' do
      expect(response).to render_template('show')
    end

    it 'Should response post title text' do
      expect(response.body).to include('Post')
    end
  end
end

require_relative '../rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    before(:example) { get user_posts_path(user_id: 1) }

    it 'Should returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it "Should renders index template" do
      expect(response).to render_template('index')
    end

    it 'Should response includes placeholder text' do
      expect(response.body).to include('This is index for Post')
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(user_id: 1, id: 1) }

    it 'Should returns http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should renders show template' do
      expect(response).to render_template('show')
    end

    it 'Should response includes placeholder text' do
      expect(response.body).to include('This is show for Post')
    end
  end
end
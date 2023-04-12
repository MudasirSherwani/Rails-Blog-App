require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all users to @users' do
      user1 = User.create(id: 1, name: 'Mudasir Sherwani', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Full Stack', post_counter: 8)
      user2 = User.create(id: 2, name: 'Mudasir Sherwani', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Full Stack', post_counter: 8)
      get :index
      expect(assigns(:users)).to eq([user1, user2])
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(id: 1, name: 'Mudasir Sherwani', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Full Stack', post_counter: 8) }

    it 'returns a success response' do
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end

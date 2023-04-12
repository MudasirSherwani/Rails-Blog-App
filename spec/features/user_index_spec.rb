require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Users Index', type: :request do
  subject { page }
  before(:each) do
    User.create(name: 'Tom', post_counter: 5, photo: 'image.jpg')
    User.create(name: 'Lilly', post_counter: 2, id: 12, photo: 'image.jpg')
  end
  it 'assigns all users to @users' do
    get users_path
    expect(assigns(:users)).to eq(User.all)
  end
  it 'renders the name of the users' do
    get users_path
    expect(response.body).to include('Tom', 'Lilly')
  end
  it 'shows number of posts of user' do
    get users_path
    expect(response.body).to include('<p>Number of posts: 2</p>')
  end
  it 'renders the profile picture of the users' do
    get users_path
    expect(response.body).to include('img')
  end
end

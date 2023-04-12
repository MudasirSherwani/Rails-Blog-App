require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Users Index', type: :feature do
  before(:example) do
    @user1 = User.create(name: 'Tom', post_counter: 5, photo: 'image.jpg')
    @user2 = User.create(name: 'Lilly', post_counter: 2, id: 12, photo: 'image.jpg')
    visit users_path
  end

  it "redirected to that user's show page after click" do
    click_link @user1.name
    expect(page).to have_current_path(user_path(@user1.id))
  end
  it 'assigns all users to @users' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end
  it 'renders the name of the users' do
    expect(page.body).to include('Tom', 'Lilly')
  end
  it 'shows number of posts of user' do
    expect(page.body).to include('<p>Number of posts: 2</p>')
  end
  it 'renders the profile picture of the users' do
    expect(page.body).to include('img')
  end
end

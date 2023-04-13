require_relative '../rails_helper'

RSpec.describe 'User testing', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(id: 1, name: 'Mudasir Sherwani', post_counter: 5, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                          bio: 'I am Mudasir Sherwani the full stack developer')
      visit users_path
    end

    it 'renders the username of all other users.' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'should render correct posts number ' do
      User.all.each do |user|
        expect(page).to have_content(user.post_counter)
      end
    end

    it "redirected to that user's show page after clicking on user" do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Mudasir Sherwani', post_counter: 5, photo: 'https://i.imgur.com/1J3wZQx.jpg',
                          bio: 'I am Mudasir Sherwani the full stack developer')
      @post1 = Post.create(title: 'Post #1', text: 'This is my first post', comment_counter: 0,
                           like_counter: 0, author: @user)
      @post2 = Post.create(title: 'Post #1', text: 'This is my first post', comment_counter: 0,
                           like_counter: 0, author: @user)
      @post3 = Post.create(title: 'Post #1', text: 'This is my first post', comment_counter: 0,
                           like_counter: 0, author: @user)

      visit user_path(id: @user.id)
    end
    it "should render user's profile picture" do
      expect(page).to have_xpath("//img[@src = '#{@user.photo}' ]")
    end
    it 'should render user name' do
      expect(page).to have_content(@user.name)
    end
    it 'should render number of posts the user has written' do
      expect(page).to have_content(@user.post_counter)
    end
    it "should render user's bio" do
      expect(page).to have_content(@user.bio)
    end
    it "should render user's first 3 posts" do
      expect(page).to have_content(@post1.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
    end
    it "should have a button to view all of a user's posts" do
      expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user.id))
    end
    it 'should redirects to all posts show page.' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user_id: @user.id))
    end
  end
end

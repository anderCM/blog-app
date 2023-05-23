require 'rails_helper'
RSpec.describe 'Users' do
  describe 'User #index' do
    before do
      visit users_path
    end

    it 'Should render Anderson and Sophie in the index page' do
      expect(page).to have_content('Anderson')
      expect(page).to have_content('Anderson 2')
      expect(page).to have_content('Anderson 3')
      expect(page).to have_content('Anderson 4')
    end

    it 'Should be able to view profile pictures' do
      @users = User.all
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'Should be able to see the number of posts each user has written' do
      @users = User.all
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.post_counter}")
      end
    end

    it 'Should redirect to the user profile page when clicking on the user name' do
      name_link = find(:css, "a:contains('#{User.last.name}')")
      name_link.click
      expect(page).to have_current_path(user_path(User.last))
    end
  end

  describe 'User #show' do
    before do
      visit user_path(User.first.id)
    end

    it 'Should be able to view profile picture' do
      expect(page).to have_css("img[src*='#{User.first.photo}']")
    end

    it 'Should be able to view the user\'s name' do
      expect(page).to have_content(User.first.name)
    end

    it 'Should be able to see the num of posst the user has written' do
      expect(page).to have_content("Number of posts: #{User.first.post_counter}")
    end

    it 'Should be able to see the user\'s bio' do
      expect(page).to have_content(User.first.bio)
    end

    it 'See Users first three posts' do
      expect(page).to have_content(User.first.last_3_posts[0].title)
      expect(page).to have_content(User.first.last_3_posts[1].title)
      expect(page).to have_content(User.first.last_3_posts[2].title)
    end

    it 'Display Button to view Users posts' do
      expect(page).to have_link('See all posts')
    end

    it 'Clicking on User post redirects to User Post Show page' do
      click_link(User.first.last_3_posts[0].title)
      expect(page).to have_current_path(user_post_path(User.first.id, User.first.last_3_posts[0].id))
    end

    it 'Clicking See all redirects user to users posts index page' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(User.first.id))
    end
  end
end

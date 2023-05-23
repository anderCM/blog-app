require 'rails_helper'
RSpec.describe 'Posts' do
  describe 'Posts #index' do
    before do
      visit user_posts_path(User.first)
      @posts = User.first.posts
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

    it 'Should be able to see the post\'s title.' do
      @posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'Should be able to some of the post\'s body.' do
      @posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end

    it 'Should be able to see the first comments on a post.' do
      @posts[0].last_5_comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'Should be able to see how many likes a post has.' do
      @posts.each do |post|
        expect(page).to have_content("Comments: #{post.comment_counter}")
      end
    end

    it 'Should be able to see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button('Pagination')
    end

    it 'Should be able to click on a post, it redirects me to that post\'s show page.' do
      click_link(@posts[0].title)
      expect(page).to have_current_path(user_post_path(@posts[0].author, @posts[0]))
    end
  end
  describe 'Posts #index' do
    before do
      @post = Post.first
      visit user_post_path(@post.author, @post)
    end

    it 'Should be able to see the post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'Should be able to see who wrote the post' do
      expect(page).to have_content("#{@post.title} by: #{@post.author.name}")
    end

    it 'Should be able to see how many comments it has' do
      expect(page).to have_content("Comments: #{@post.comment_counter}")
    end

    it 'Should be able to see how many likes it has' do
      expect(page).to have_button("Likes: #{@post.like_counter}")
      # expect(page).to have_content("Likes: #{@post.like_counter}")
    end

    it 'Should see the post body.' do
      expect(page).to have_content(@post.text)
    end

    it 'Should see the username of each commentor.' do
      expect(page).to have_content(@post.comments.first.user.name)
    end

    it 'Should see the comment each commentor left.' do
      expect(page).to have_content(@post.comments.first.text)
    end
  end
end

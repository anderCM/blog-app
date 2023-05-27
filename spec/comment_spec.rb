require 'rails_helper'
describe Comment, type: :model do
  it 'Should save a comment' do
    user = User.new(name: 'Ronaldinho', post_counter: 0)
    user.save
    post = Post.new(author: user, title: 'Hello World', text: 'This is my first hello world', comment_counter: 0,
                    like_counter: 0)
    post.save
    user_comment = User.new(name: 'Messi', post_counter: 0)
    user_comment.save
    comment = Comment.new(user: user_comment, post:, text: "Nice post @#{user.name}")
    save_comment = comment.save
    expect(comment.text).to eq('Nice post @Ronaldinho')
    expect(save_comment).to eq(true)
  end

  it 'Should increment comment counter' do
    user = User.new(name: 'Anderson CM', post_counter: 0)
    user.save
    post = Post.new(author: user, title: 'How to become a software developer', text: 'The first step is...',
                    comment_counter: 0, like_counter: 0)
    post.save
    user_comment = User.new(name: 'Yensi Roff', post_counter: 0)
    user_comment.save
    comment = Comment.new(user: user_comment, post:, text: "Hello @#{user.name}, it's interesting because....")
    comment.save
    expect(post.comment_counter).to eq(1)
  end
end

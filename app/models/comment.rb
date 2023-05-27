class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comment_counter
  after_destroy :decrement_comment_counter

  def increment_comment_counter
    post.increment!(:comment_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comment_counter)
  end
end

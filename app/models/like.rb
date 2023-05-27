class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_like_counter
  after_destroy :decrement_like_counter

  def increment_like_counter
    post.increment!(:like_counter)
  end

  def decrement_like_counter
    post.decrement!(:like_counter)
  end
end

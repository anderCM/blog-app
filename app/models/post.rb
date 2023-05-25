class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  attribute :comment_counter, default: 0
  attribute :like_counter, default: 0

  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  def last_5_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:post_counter)
  end

  def decrement_posts_counter
    author.decrement!(:post_counter)
  end
end

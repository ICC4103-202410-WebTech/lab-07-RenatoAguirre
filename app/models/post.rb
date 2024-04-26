class Post < ApplicationRecord
  belongs_to :user

  has_many :post_tag
  has_many :tags, through: :post_tag

  belongs_to :parent_post, class_name: "Post", optional: true
  add_reference :posts, :parent_post, null: false, foreign_key: true

  validates :title, presence: { message: "Provide a title!" }
  validates :content, presence: { message: "I cannot exist without content :(" }
  validates :user_id, presence: true
  validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count can't be a non-negative.... Think about it, how can they be negative?" }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count should be a non-negative number...." }
  
  after_initialize :set_default_published_at
  
  private
  
  def set_default_published_at
    self.published_at ||= Time.current
  end
end
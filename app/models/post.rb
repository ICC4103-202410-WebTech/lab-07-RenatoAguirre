class Post < ApplicationRecord
  belongs_to :user

  has_many :post_tag
  has_many :tags, through: :post_tag

  belongs_to :parent_post, class_name: "Post", optional: true
  add_reference :posts, :parent_post, null: false, foreign_key: true
end
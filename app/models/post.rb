class Post < ApplicationRecord
  belongs_to :user

  has_many :post_tag
  has_many :tags, through: :post_tag
end
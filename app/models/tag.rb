class Tag < ApplicationRecord
  has_many :post_tag
  has_many :posts, through: :post_tag

  validates :name, presence: { message: "Please provide a name for the tag." }, uniqueness: { message: "Tag with this name already exists." }
end

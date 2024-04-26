class User < ApplicationRecord
  has_many :posts

  validates :name, presence: { message: "Please provide your name." }
  validates :email, presence: { message: "Please provide your email." }, uniqueness: { message: "This email is already taken." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please provide a valid email address." }
  validates :password, presence: { message: "Please provide a password." }, length: { minimum: 6, message: "Password must be at least 6 characters long." }
end
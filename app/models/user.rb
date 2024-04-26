class User < ApplicationRecord
  has_many :posts

  validates :name, presence: { message: "Please provide your name! Surely you must have one" }
  validates :email, presence: { message: "Please provide your email!" }, uniqueness: { message: "This email is already taken, weird" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please provide a valid email address don't try to fool me" }
  validates :password, presence: { message: "Are you sure you're gonna go without a password? bold, but try again" }, length: { minimum: 6, message: "Password's too short man, someone's about to hack you bruh'" }
end
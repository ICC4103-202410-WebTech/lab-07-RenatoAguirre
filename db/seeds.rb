# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.delete_all


# Create Users
5.times do |i|
  user = User.create!(
    name: "User #{i+1}",
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6)
  )


  # Create at least one post for each user
  user.posts.create!(
    title: "Post #{i+1}",
    content: Faker::Lorem.paragraph,
    answers_count: 0,
    likes_count: 0
  )
end

# Create John Doe
john = User.create!(
  name: "John Doe",
  email: "joh_doe@miuandes.cl",
  password: "123456"
)
john.posts.create!(
  title: "Hello, World!",
  content: "This is my first post. I'm so excited to be here!",
  answers_count: 0,
  likes_count: 10000
)


# Seed Tags
tags = []
5.times do |i|
  tag = Tag.create!(
    name: "Tag #{i+1}"
  )
  tags << tag
end

# Seed Posts
10.times do
  post = Post.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user: User.all.sample,
    answers_count: 0,
    likes_count: 0,
    published_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )

  # Ensure each post has at least one tag
  post.tags << tags.sample

  # Ensure each tag is associated with at least one post
  tags.each do |tag|
    post = Post.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      user: User.all.sample,
      answers_count: 0,
      likes_count: 0,
      published_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
    post.tags << tag
  end
end
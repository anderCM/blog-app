# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

6.times { user = User.create!(name: Faker::Name.first_name, photo: Faker::Avatar.image, bio: Faker::Job.title, post_counter: 10) }

User.all.each do |user|
  10.times do
    post = Post.create!(
      title: Faker::Quotes::Shakespeare.hamlet_quote, 
      text: Faker::Quote.matz,
      author: user,
      comment_counter: 0,
      like_counter: 0
    )

    10.times do 
      user = User.order("RANDOM()").first
      Comment.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, user:, post:)
    end

    10.times do 
      user = User.order("RANDOM()").first
      Like.create!(user:, post:)
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

# Find or Create unique post
Post.find_or_create_by(title: 'My unique post title') do |post| post.body = 'My unique post body'
end

Comment.find_or_create_by(body: 'a uniue comment body 1') do |comment|
  comment.post_id = 1
end

Comment.find_or_create_by(body: 'a uniue comment body 2') do |comment|
  comment.post_id = 1
end

# Create Posts
50.times do
  # #1
  Post.create!(
    # #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
    # #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

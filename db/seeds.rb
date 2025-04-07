# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
puts "Clearing existing data..."
Comment.destroy_all
Post.destroy_all

# Create sample posts
puts "Creating posts..."
posts = [
  {
    title: "Getting Started with Ruby on Rails",
    body: "Ruby on Rails is a web application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern. Rails is opinionated software and assumes that there is a 'best' way to do things, and it's designed to encourage that way – and in some cases to discourage alternatives.",
    published: true
  },
  {
    title: "Understanding Active Record in Rails",
    body: "Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It is an implementation of the Active Record pattern which itself is a description of an Object Relational Mapping system.",
    published: true
  },
  {
    title: "Mastering Rails Views",
    body: "Action View is responsible for generating the HTML for web requests. It has template engines, AJAX support, and view helpers. View templates are written using embedded Ruby mixed with HTML. Beyond the basics of ERB, there are a variety of helper methods for handling form tags, dates, and string manipulation. AJAX support comes in the form of JavaScript generators that build AJAX calls.",
    published: true
  },
  {
    title: "The Power of Active Storage",
    body: "Active Storage facilitates uploading files to a cloud storage service like Amazon S3, Google Cloud Storage, or Microsoft Azure Storage and attaching those files to Active Record objects. It comes with a local disk-based service for development and testing and supports mirroring files to subordinate services for backups and migrations.",
    published: true
  },
  {
    title: "Working with Action Mailer",
    body: "Action Mailer is a framework for building email services. It has both a controller layer for handling requests and a view layer for crafting the email templates. It gives you tools for making attractive email with layouts, embedding images, and adding attachments.",
    published: false
  }
]

created_posts = posts.map do |post_data|
  Post.create!(post_data)
end

# Create sample comments for each post
puts "Creating comments..."
comments_data = [
  "Great article! This really helped me understand the concept better.",
  "I have a question about this. Can you provide more examples?",
  "Thanks for sharing this knowledge. I've been struggling with this for weeks.",
  "This is exactly what I needed to read today. Very informative!",
  "I disagree with some points in this article. Let me explain why...",
  "Have you considered exploring the relationship with other frameworks?",
  "The code examples were particularly useful. Thanks!",
  "Looking forward to more articles on this topic.",
  "I implemented this in my project and it worked perfectly!",
  "Could you elaborate more on the performance implications?"
]

created_posts.each do |post|
  # Add 2-5 comments to each published post
  if post.published
    rand(2..5).times do
      post.comments.create!(
        content: comments_data.sample
      )
    end
  end
end

puts "Seed data created successfully!"
puts "Created #{Post.count} posts and #{Comment.count} comments."

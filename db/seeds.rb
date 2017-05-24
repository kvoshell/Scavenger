 require 'faker'
 #
 #  # Random Seeding for Development
 #
 #
 #  # admin = User.create!(
 #  #  email: 'admin@example.com',
 #  #  password: 'helloworld',
 #  #  role: 'admin',
 #  #  confirmed_at: Time.now
 #  # )
 #  #
 #  # member = User.create!(
 #  #  email: 'member@example.com',
 #  #  password: 'helloworld',
 #  #  confirmed_at: Time.now
 #  # )
 #  #
 #  # premium = User.create!(
 #  #  email: 'premium@example.com',
 #  #  password: 'helloworld',
 #  #  role: 'premium',
 #  #  confirmed_at: Time.now
 #  # )
 #  #
 #  #  users = User.all
 #
   20.times do
     Topic.create!(
      title: Faker::Hipster.word,
      user_id: 1
      )
   end

   topics = Topic.all

   10.times do
     Bookmark.create!(
      url: "https://www.hipster.com",
      topic_id: 20,
      title: Faker::Hipster.sentence,
      user_id: 1
     )
   end

   10.times do
     Bookmark.create!(
      url: "https://www.hipster.com",
      topic_id: 20,
      title: Faker::Hipster.sentence,
      user_id: 2
     )
   end

   bookmarks = Bookmark.all

   puts "Seed Generated"
   puts "#{Topic.count} topics created."
   puts "#{Bookmark.count} bookmarks created."

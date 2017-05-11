require 'faker'

  # admin = User.create!(
  #  email: 'admin@example.com',
  #  password: 'helloworld',
  #  role: 'admin',
  #  confirmed_at: Time.now
  # )
  #
  # member = User.create!(
  #  email: 'member@example.com',
  #  password: 'helloworld',
  #  confirmed_at: Time.now
  # )
  #
  # premium = User.create!(
  #  email: 'premium@example.com',
  #  password: 'helloworld',
  #  role: 'premium',
  #  confirmed_at: Time.now
  # )
  #
  #  users = User.all

   20.times do
     Topic.create!(
       title: Faker::Hipster.sentence,
      #  body: Faker::Hipster.paragraph
     )
   end

   topics = Topic.all

   puts "Seed Generated"
   puts "#{Topic.count} topics created."
  #  puts "#{Wiki.count} wikis created."

require 'faker'

def em string
  puts "*" * 50
  puts "   " + string
  puts "*" * 50
end

def get_long_content
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote +
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote +
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote
end

def get_short_content
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote
end

em "Creating admin user"

User.create(email: "test1@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: Faker::Book.author, roles: "admin")

puts '1 Admin User created'

em "Creating user"

User.create(email: "regular@joe.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: Faker::Book.author, roles: "user" )

puts '1 User created'

em "Creating Blogs"

user_count = User.count
20.times do |i|
  Blog.create!(title: Faker::Book.title,
               body: get_long_content,
               image: "https://picsum.photos/600/400/?image=#{[*1..800].sample}",
               user_id: [*1..user_count].sample
               )
  puts "Blog #{i} created"
end

em "Creating Comments"

blog_count = Blog.count
(blog_count * 5).times do |i|
  Comment.create(body: get_short_content,
                 user_id: [*1..user_count].sample,
                 blog_id: [*1..blog_count].sample
                 )
  puts "Comment #{i} created"
end












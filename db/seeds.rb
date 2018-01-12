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

def get_random_quote
  case [*1..6].sample
    when 1 then Faker::HitchhikersGuideToTheGalaxy.quote
    when 2 then Faker::HeyArnold.quote
    when 3 then Faker::HowIMetYourMother.quote
    when 4 then Faker::Movie.quote
    when 5 then Faker::Seinfeld.quote
    when 6 then Faker::Dune.quote
  end
end

def get_profile_image
  "http://placebeard.it/#{[*145..155].sample}/#{[*145..155].sample}"
end

cats = [Faker::ProgrammingLanguage.name,Faker::ProgrammingLanguage.name,Faker::ProgrammingLanguage.name,Faker::ProgrammingLanguage.name,Faker::ProgrammingLanguage.name]

em cats.to_s

em "Creating admin user"

User.create(email: "test1@test.com", 
            password: "asdfasdf", 
            password_confirmation: "asdfasdf", 
            name: Faker::Book.author, 
            roles: "admin",
            image: get_profile_image)

puts '1 Admin User created'

em "Creating user"

User.create(email: "regular@joe.com", 
            password: "asdfasdf", 
            password_confirmation: "asdfasdf", 
            name: Faker::Book.author, 
            roles: "user",
            image: get_profile_image )

puts '1 User created'

em "Creating random Users"

4.times do |i|
  User.create(email: "regular#{i}@joe.com", 
              password: "asdfasdf", 
              password_confirmation: "asdfasdf", 
              name: Faker::Book.author, 
              roles: "user",
              image: get_profile_image )
  puts "User #{i} created"
end

em "Creating Blogs"

user_count = User.count
20.times do |i|
  Blog.create!(title: Faker::Book.title,
               body: get_long_content,
               image: "https://picsum.photos/600/400/?image=#{[*1..800].sample}",
               user_id: [*1..user_count].sample,
               category: cats.sample
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

em "Creating chat rooms"

User.all.each do |u|
  title = Faker::Book.title
  u.chat_rooms.create!(title: title)
  puts "Chat-Room: #{title} created for #{u.name}"
end

em "Creating messages"
chat_count = ChatRoom.count
(user_count * 5).times do |i|
  body = get_random_quote
  room = [*1..chat_count].sample
  user = [*1..user_count].sample
  Message.create!(body: body,
                  user_id: user,
                  chat_room_id: room)
puts "Message #{body} created for user #{user} in room #{room}"

end












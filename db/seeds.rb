require 'faker'


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


User.create(email: "test1@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: Faker::Book.author, roles: "admin")

puts '1 Admin User created'

User.create(email: "regular@joe.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: Faker::Book.author, roles: "user" )

puts '1 User created'

20.times do |i|
  Blog.create!(title: Faker::Book.title,
               body: get_long_content,
               image: "https://picsum.photos/600/400/?image=#{[*1..800].sample}",
               user_id: [1,2].sample
               )
end


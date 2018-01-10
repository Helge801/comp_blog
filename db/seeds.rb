AdminUser = User.create(email: "test1@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: "Bob Admin", roles: "admin")

puts '1 Admin User created'

@user = User.create(email: "regular@joe.com", password: "asdfasdf", password_confirmation: "asdfasdf", name: "Regular Joe", roles: "user" )

puts '1 User created'

# 20.times do |i|
#   Blog.
# end
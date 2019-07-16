User.create!(email: "oscarmolivera@gmail.com", first_name: "Oscar", last_name: "Olivera", password: "123456", password_confirmation: "123456")
User.create!(email: "usuario2@gmail.com", first_name: "Normal", last_name: "User", password: "123456", password_confirmation: "123456")
User.create!(email: "newadmin@mysite.com", first_name: "Admin", last_name: "User", password: "123456", password_confirmation: "123456", type: :AdminUser)
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post} It is a Comment POst!", user_id: 1)
end
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post} It is a Comment POst!", user_id: 2)
end
10.times do |post|
  Post.create!(date: Date.today, rationale:"#{post} It is a Comment POst!", user_id: 3)
end
puts "Creados 60 Posts!"

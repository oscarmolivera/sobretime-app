User.create!(email: "oscarmolivera@gmail.com", first_name: "Oscar", last_name: "Olivera", password: "123456", password_confirmation: "123456")
User.create!(email: "usuario2@gmail.com", first_name: "Normal", last_name: "User", password: "123456", password_confirmation: "123456")
AdminUser.create!(email: "newadmin@mysite.com", first_name: "Admin", last_name: "User", password: "123456", password_confirmation: "123456")
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post from Oscar Olivera!", user_id: 1, overtime_request: 1.0)
end
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post From Normal User!", user_id: 2, overtime_request: 1.3)
end
10.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post from ADMIN User!", user_id: 3, overtime_request: 0.5)
end
puts "Creados 60 Posts!"

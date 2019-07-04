User.create!(email: "oscarmolivera@gmail.com", first_name: "Oscar", last_name: "Olivera", password: "147852", password_confirmation: "147852")

100.times do |post|
  Post.create!(date: Date.today, rationale:"#{post} It is a Comment POst!", user_id: 1)
end
puts "Creados 100 Posts!"

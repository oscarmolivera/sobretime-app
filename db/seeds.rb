User.create!(email: "oscarmolivera@gmail.com", first_name: "Oscar", last_name: "Olivera", password: "123456", password_confirmation: "123456", phone: "6947880067")
User.create!(email: "usuario2@gmail.com", first_name: "Normal", last_name: "User", password: "123456", password_confirmation: "123456", phone: "6978663322")
AdminUser.create!(email: "newadmin@mysite.com", first_name: "Admin", last_name: "User", password: "123456", password_confirmation: "123456", phone: "6947880067")
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post from Oscar Olivera!", user_id: 1, overtime_request: 1.0)
end
20.times do |audit_log|
  AuditLog.create!(user_id: 1, status: 0, start_date: ((Date.today + audit_log.days) -6.days ))
end
20.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post From Normal User!", user_id: 2, overtime_request: 1.3)
end
20.times do |audit_log|
  AuditLog.create!(user_id: 2, status: 0, start_date: ((Date.today + audit_log.days) -6.days ))
end
10.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} It is a Comment Post from ADMIN User!", user_id: 3, overtime_request: 0.5)
end
puts "Creados 50 Posts!"
puts "Creados 40 Auditorias!"

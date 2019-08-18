@employee = Employee.create(email: "oscarmolivera@gmail.com", 
                            first_name: "Oscar", 
                            last_name: "Olivera", 
                            password: "123456", 
                            password_confirmation: "123456", 
                            phone: "947880067")

puts "Empleado Creado"

AdminUser.create(email: "oscarmolivera@outlook.com", 
                 first_name: "Admin", 
                 last_name: "User", 
                 password: "123456", 
                 password_confirmation: "123456", 
                 phone: "947880069")
puts "Administrador Creado"

AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
puts "3 Logs Creados"

5.times do |post|
  Post.create!(date: Date.today, rationale:"#{post+1} Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                                            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when 
                                            an unknown printer took a galley of type and scrambled it to make a type specimen 
                                            book. It has survived not only five centuries, but also the leap into electronic 
                                            typesetting, remaining essentially unchanged. It was popularised in the 1960s with 
                                            the release of Letraset sheets containing Lorem Ipsum passages, and more recently 
                                            with desktop publishing software like Aldus PageMaker including versions of Lorem 
                                            Ipsum!", user_id: @employee.id, overtime_request: 1.0)
end
puts "5 POST Creados por cada usuario"
namespace :notification do
  desc "Envia notificaciones SMS a empleados solitando que registen o no sus horas extras."
  task sms: :environment do
    puts "...Desde un TASK de Rails"
  end

end

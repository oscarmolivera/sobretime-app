namespace :notification do
  desc "Envia notificaciones SMS a empleados solitando que registen o no sus horas extras."
  task sms: :environment do
    if Time.now.sunday?
      puts "...Envio de SMS"
    end
  end

  desc "Envia notificaciones de correo a los gerentes (Admins) cada dia para informar sobre horas extras  ."
  task manager_email: :environment do
    submitted_posts = Post.registrado
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |au|
        ManagerMailer.email(au).deliver_later
      end
    end
  end

end

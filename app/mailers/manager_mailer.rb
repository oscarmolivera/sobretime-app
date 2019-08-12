class ManagerMailer < ApplicationMailer
  def email manager
    @manager = manager 
    mail(to: @manager.email, subject: 'Envio Diario de Solicitudes')
  end
end

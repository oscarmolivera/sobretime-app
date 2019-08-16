ActionMailer::Base.smtp_settings = {
  port: ENV['MAILGUN_SMTP_PORT'], 
  address: ENV['MAILGUN_SMTP_SERVER'], 
  user_name: ENV['MAILGUN_SMTP_LOGIN'], 
  password: ENV['MAILGUN_SMTP_PASSWORD'], 
  authentication:  :login,
  :enable_starttls_auto: :true
}
ActionMailer::Base.delivery_method = :smtp
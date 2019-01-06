Symbit::Application.configure do
  # mailer config
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'example.com',
    user_name:            "#{Rails.application.credentials.gmail[:user_name]}",
    password:             "#{Rails.application.credentials.gmail[:password]}",
    authentication:       'plain',
    enable_starttls_auto: true
  }
end

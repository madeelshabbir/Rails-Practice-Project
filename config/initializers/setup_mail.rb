ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'devsinc.com',
  user_name:            'adeel@devsinc.com',
  password:             'koderpack',
  authentication:       'plain',
  enable_starttls_auto: true }

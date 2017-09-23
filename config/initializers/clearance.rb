Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.allow_sign_up = true

  config.rotate_csrf_on_sign_in = true
end

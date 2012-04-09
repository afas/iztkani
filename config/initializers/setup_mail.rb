ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "iz-tkani.ru",
  :user_name            => "izztkani",
  :password             => "qwerty4139751",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

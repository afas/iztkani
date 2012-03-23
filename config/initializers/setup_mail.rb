ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "iz-tkani.ru",
  :user_name            => "fasexe",
  :password             => "enlightenment1985",
  #:user_name            => "muslishire",
  #:password             => "qwerty2642983",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

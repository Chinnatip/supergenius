# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# action mailer
ActionMailer::Base.smtp_settings = {
  :user_name => 'supergenius',
  :password => 'supergeniusschool1234',
  :domain => 'supergeniusco.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

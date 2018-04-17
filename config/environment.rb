# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
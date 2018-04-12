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
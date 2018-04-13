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
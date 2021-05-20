# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'yourdomain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

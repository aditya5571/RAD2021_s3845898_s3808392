class UserNotifierMailer < ApplicationMailer
    default :from => 's3845898@student.rmit.edu.au'
  
    def send_signup_email(email)
      mail( to: email,
      subject: 'Subscription confirmation',
      message: '' )
    end
end

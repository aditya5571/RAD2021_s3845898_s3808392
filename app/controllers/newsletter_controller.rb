class NewsletterController < ApplicationController
    def subscribe
        if params[:email]
            puts "SENDING EMAIL"
            UserNotifierMailer.send_signup_email(params[:email]).deliver
        end
    end
end
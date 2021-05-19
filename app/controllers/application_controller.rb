class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def saved_text
  #   return @saved_exists ? "(Unsave)" : "(Save product)"
  # end

  # helper_method :saved_text
end

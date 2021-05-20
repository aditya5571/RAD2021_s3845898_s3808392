class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
    def cookies
      request.cookie_jar
    end
end

class Product < ApplicationRecord
   
   def increasePopularity
       self.popularity += 1
       self.save
   end
   
   def decreasePopularity
       if self.popularity > 1
           self.popularity -= 1
           self.save       
       end
   end
end

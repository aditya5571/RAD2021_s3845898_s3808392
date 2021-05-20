class Product < ApplicationRecord
    @saved
    
    def setSaved
        @saved = true
    end
end

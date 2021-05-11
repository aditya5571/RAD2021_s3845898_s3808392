class Item < ApplicationRecord
    def self.filterByMen
        Item.where(category: "Men")
    end

    def self.filterByWomen
        Item.where(category: "Women")
    end

    def self.filterByKids
        Item.where(category: "Kids")
    end

    def self.filterByNewins
        Item.where(category: "Newins")
    end
end

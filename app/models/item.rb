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

    # def self.filterByNewins
    #     Item.where(category: "Newins")
    # end

    def self.CountRowsMen
        Item.where(category: "Men").size
    end

    def self.CountRowsWomen
        Item.where(category: "Women").size
    end

    def self.CountRowsKids
        Item.where(category: "Kids").size
    end

    def self.CountRowsNewins
        Item.where(category: "Newins").size
    end

    def self.GetTotalItems
        Item.count
    end

    def self.GetPoplularItems
        # Item.where("popularity > ?", 2)
        Item.find_by_sql ["SELECT * FROM items WHERE popularity > 3 ORDER BY popularity DESC"]
    end

    def self.RecentlyStocked
        Item.where(date_stocked: 3.months.ago..Time.now.end_of_month).all
    end

    def self.GetRandom
        Item.find_by_sql ["SELECT * FROM items ORDER BY RANDOM() LIMIT 1"]
    end

    def self.SavedTable
        r= Item.find_by_sql ["SELECT * FROM saveds"]
        puts r
    end

    def getItemById
        Item.where(id: params[:id])
    end
end

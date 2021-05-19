class ProductItem < ApplicationRecord
  belongs_to :item
  belongs_to :saved
end

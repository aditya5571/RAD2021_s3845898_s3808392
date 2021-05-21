class ProductVariant < ApplicationRecord
    belongs_to :product
    belongs_to :colour
    belongs_to :size
end

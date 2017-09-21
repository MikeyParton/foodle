class Ingredient < ApplicationRecord
  belongs_to :product_ingredient, required: false
end

class ProductIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient

  delegate :name, :description, to: :ingredient
end

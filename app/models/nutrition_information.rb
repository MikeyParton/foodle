class NutritionInformation < ApplicationRecord
  belongs_to :product
  has_many :nutrition_information_rows
end

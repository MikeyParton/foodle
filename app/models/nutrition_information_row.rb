class NutritionInformationRow < ApplicationRecord
  extend Enumerize
  belongs_to :nutrition_information

  enumerize :units, in: %i[g mg kj cal]
  enumerize(:nutrient, in: %i[
      energy
      protein
      fat_total
      fat_saturated
      fat_trans_unsaturated
      fat_polyunsaturated
      carbohydrate
      sugar_total
      fibre_dietary
      sodium
    ]
  )
end

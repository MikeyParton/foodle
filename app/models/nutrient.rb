class Nutrient < ApplicationRecord
  belongs_to :product

  enum unit: Options::Units::AllUnits.all_as_sym
  enum name: Options::NutrientNames.all_as_sym

  validates :unit, presence: true, allow_nil: false
  validates :unit, inclusion: { in: Options::Units::AllUnits.all_as_sym.map(&:to_s), allow_blank: false }

  validates :name, presence: true, allow_nil: false
  validates :name, inclusion: { in: Options::NutrientNames.all_as_sym.map(&:to_s), allow_blank: false }
end

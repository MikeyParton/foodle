class Nutrients < ApplicationRecord
  self.table_name = 'nutrients'
  belongs_to :product

  def in(units_string = "35 g")
    NutrientsCalculator.new(self, units_string).process
  end
end

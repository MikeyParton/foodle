class Nutrients < ApplicationRecord
  self.table_name = 'nutrients'
  belongs_to :product

  def serving_base
    "#{serving_value} #{serving_unit}"
  end
end

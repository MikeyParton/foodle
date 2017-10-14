class NutrientsCalculator
  def initialize(nutrients, serving)
    @nutrients = nutrients
    @serving = serving
  end

  def process
    Nutrients.new(
      energy_base_value: convert_unit(@nutrients.energy_base_value)
    )
  end

  def convert_unit(unit)
    factor = Unit.new(@serving) / Unit.new('100g')
    (unit * factor).to_i
  end
end

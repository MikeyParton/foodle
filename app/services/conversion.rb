class Conversion
  def initialize(input)
    @input = input
  end

  def convert_to(target_unit)
    return nil_out unless @input.present?
    unit = Unit.new(@input.tr('μ', 'u'))
    converted = unit.convert_to(target_unit)
    OpenStruct.new(value: converted.scalar, unit: converted.units)
  end

  def how_many_in(other_unit_string)
    other_unit = Unit.new(other_unit_string)
    Conversion.new(@input).convert_to(other_unit.units).value / other_unit.scalar
  end

  private

  def nil_out
    OpenStruct.new(value: nil, unit: nil)
  end
end

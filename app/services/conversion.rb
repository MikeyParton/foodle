class Conversion
  def initialize(input, target_unit)
    @input = input
    @target_unit = target_unit
  end

  def convert
    return nil unless @input.present?
    unit = Unit.new(@input.tr('μ', 'u'))
    unit.convert_to(@target_unit)
  end
end

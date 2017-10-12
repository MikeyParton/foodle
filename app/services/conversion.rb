class Conversion

  DEFAULT_UNITS = {
    volume: "ul",
    weight: "mg",
    energy: "J"
  }

  def initialize(input, type, target_unit = nil)
    @input = input.tr('μ', 'u')
    @target_unit = target_unit || DEFAULT_UNITS[type]
  end

  def convert
    unit = Unit.new(@input)
    unit.convert_to(@target_unit).scalar
  end
end

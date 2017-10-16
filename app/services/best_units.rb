class BestUnits
  METRIC_WEIGHT_UNITS = %w(ug mg g kg)
  METRIC_ENERGY_UNITS = %w(J kJ)

  def initialize(input)
    @unit = Unit.new(input)
  end

  def process
    if METRIC_WEIGHT_UNITS.include?(@unit.units)
      best_metric_weight_units
    elsif METRIC_ENERGY_UNITS.include?(@unit.units)
      best_metric_energy_units
    end
  end

  private

  def best_metric_energy_units
    case @unit.base_scalar
    when 0...1*10**3
      'J'
    when 1*10**3...Float::INFINITY
      'kJ'
    else
      'J'
    end
  end

  def best_metric_weight_units
    case @unit.base_scalar
    when 0...1*10**-6
      'ug'
    when 1*10**-6...1*10**-3
      'mg'
    when 1*10**-3...1
      'g'
    when 1...Float::INFINITY
      'kg'
    else
      'g'
    end
  end
end

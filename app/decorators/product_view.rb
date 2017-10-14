# Converts product nutrient and serving values to the units
# outlined in some preferences model
class ProductView
  extend Forwardable
  def_delegators :@product, :id, :name, :barcode, :brands, :ingredients

  WEIGHT_VALUES = %w[fat proteins energy carbohydrates sugars sodium fat fiber]

  def initialize(product, preferences = nil)
    @product = product
    @preferences = preferences || ::NullPreferences.new
  end

  def energy
    string = "#{@product.energy} #{Conversion::BASE_UNITS[:energy]}"
    Conversion.new(string, @preferences.energy_unit).convert.to_f
  end

  WEIGHT_VALUES.each do |weight_value|
    define_method weight_value do
      base_value = @product.send(weight_value)
      base_units = Conversion::BASE_UNITS[:weight]
      return '-' unless base_value.present?
      string = "#{base_value} #{base_units}"
      Conversion.new(string, @preferences.weight_unit).convert.to_f
    end
  end
end

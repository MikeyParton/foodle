class NutrientsView < SimpleDelegator

  PROPERTIES = %w[energy fat proteins energy carbohydrates sugars sodium fat fiber]

  def initialize(nutrients, serving = '100g')
    @serving = serving
    @factor = Conversion.new(@serving, 'g').convert.scalar / 100
    super(nutrients)
  end

  PROPERTIES.each do |property|
    define_method "#{property}_value" do
      base_value = self.send("#{property}_base_value")
      return nil unless base_value.present?
      (base_value * @factor).to_i
    end

    define_method "#{property}_unit" do
      base_unit = self.send("#{property}_base_unit")
      return nil unless base_unit.present?
      base_unit
    end
  end
end

class NutrientsView < SimpleDelegator
  PROPERTIES = %w[energy fat proteins energy carbohydrates sugars sodium fat fiber]

  def initialize(nutrients, serving)
    @serving = serving || '100g'
    @factor = Conversion.new(@serving).how_many_in(nutrients.serving_base)
    super(nutrients)
  end

  PROPERTIES.each do |property|
    define_method "#{property}_value" do
      base_value = send("#{property}_base_value")
      base_unit = send("#{property}_base_unit")

      if base_value.present?
        serving_value = (base_value * @factor)
        serving_string = "#{serving_value} #{base_unit}"
        best_unit = BestUnits.new(serving_string).process
        best_value = Conversion.new(serving_string).convert_to(best_unit).value.to_f
      end

      return nil unless base_value.present?
      best_value
    end

    define_method "#{property}_unit" do
      base_value = send("#{property}_base_value")
      base_unit = send("#{property}_base_unit")

      if base_value.present?
        serving_value = (base_value * @factor)
        best_unit = BestUnits.new("#{serving_value} #{base_unit}").process
      end

      return nil unless base_value.present?
      best_unit
    end
  end
end

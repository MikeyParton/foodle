module Options
  class NutrientNames < Base
    @options = %w(energy proteins fat carbohydrates sugars fiber sodium)

    def initialize(option)
      @option = option
    end

    def to_s
      I18n.t @option, scope: [:options, :nutrient_names]
    end
  end
end

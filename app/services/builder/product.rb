module Builder
  class Product
    BASE_UNITS = { volume: 'ul', weight: 'mg', energy: 'J' }
    BASE_SERVING_VALUE = 100000 # save all nutrients as 100g values

    def initialize(params)
      @params = params
      @barcode = params[:barcode]
      @name = params[:name]
      @serving = params[:serving]
      @source = params[:source] || "foodle"

      # associations
      @brands = params[:brands] || []
      @ingredients = params[:ingredients] || []

      # nutrient params
      @energy = params.dig(:nutrients, :energy)
      @proteins = params.dig(:nutrients, :proteins)
      @carbohydrates = params.dig(:nutrients, :carbohydrates)
      @fat = params.dig(:nutrients, :fat)
      @sugars = params.dig(:nutrients, :sugars)
      @sodium = params.dig(:nutrients, :sodium)
      @fiber = params.dig(:nutrients, :fiber)
    end

    def save
      ActiveRecord::Base.transaction do
        @product = build_product
        build_brands
        build_ingredients
        build_nutrients
        @product
      end
    end

    private

    def build_product
      ::Product.create(
        barcode: @barcode,
        name: @name,
        serving_value: converted_serving.value,
        serving_unit: converted_serving.unit,
        source: @source,
        liquid: liquid?
      )
    end

    def converted_nutrients
      {
        energy: Conversion.new(@energy).convert_to(BASE_UNITS[:energy]),
        proteins: Conversion.new(@proteins).convert_to(BASE_UNITS[:weight]),
        carbohydrates: Conversion.new(@carbohydrates).convert_to(BASE_UNITS[:weight]),
        fat: Conversion.new(@fat).convert_to(BASE_UNITS[:weight]),
        sodium: Conversion.new(@sodium).convert_to(BASE_UNITS[:weight]),
        fiber: Conversion.new(@fiber).convert_to(BASE_UNITS[:weight]),
        sugars: Conversion.new(@sugars).convert_to(BASE_UNITS[:weight])
      }
    end

    def build_brands
      built_brands = @brands.map do |name|
        ::Brand.find_or_create_by(name: name)
      end
      @product.brands << built_brands
    end

    def build_ingredients
      built_ingredients = @ingredients.map do |name|
        ::Ingredient.find_or_create_by(name: name)
      end
      @product.ingredients << built_ingredients
    end

    def converted_serving
      Conversion.new(@serving).convert_to(serving_unit)
    end

    def build_nutrients
      ::Nutrients.create(nutrient_params.merge(
        serving_value: 100000,
        serving_unit: serving_unit
      ))
    end

    def nutrient_params
      converted_nutrients.inject({ product: @product }) do |result, element|
        name = element[0]
        conversion = element[1]

        base_unit = conversion.unit
        base_value = conversion.value
        base_value /= nutrient_serving_factor if base_value.present?

        result["#{name}_base_value".to_sym] = base_value
        result["#{name}_base_unit".to_sym] = base_unit
        result
      end
    end

    def liquid?
      return nil unless @serving.present?
      @serving =~ /g/ ? false : true
    end

    def serving_unit
      liquid? ? BASE_UNITS[:volume] : BASE_UNITS[:weight]
    end

    def nutrient_serving_factor
      # calculate multiplication factor to convert nutrients to 100g values
      string = @params.dig(:nutrients, :serving)
      return nil unless string.present?
      Conversion.new(string).how_many_in("#{BASE_SERVING_VALUE} #{serving_unit}")
    end
  end
end

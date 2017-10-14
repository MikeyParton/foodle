module Builder
  class Product
    BASE_UNITS = {
      volume: 'ul',
      weight: 'mg',
      energy: 'J'
    }

    def initialize(params)
      @barcode = params[:barcode]
      @name = params[:name]
      @serving = params[:serving]
      @serving_weight = params[:serving_weight]
      @energy = params[:energy]
      @proteins = params[:proteins]
      @carbohydrates = params[:carbohydrates]
      @fat = params[:fat]
      @sugars = params[:sugars]
      @sodium = params[:sodium]
      @fiber = params[:fiber]
      @brands = params[:brands] || []
      @ingredients = params[:ingredients] || []
      @source = params[:source] || "foodle"
      self
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
        serving_value: converted_serving.try(:scalar),
        serving_unit: converted_serving.try(:units),
        source: @source,
        liquid: liquid?
      )
    end

    def converted_nutrients
      {
        energy: Conversion.new(@energy, BASE_UNITS[:energy]).convert,
        proteins: Conversion.new(@proteins, BASE_UNITS[:weight]).convert,
        carbohydrates: Conversion.new(@carbohydrates, BASE_UNITS[:weight]).convert,
        fat: Conversion.new(@fat, BASE_UNITS[:weight]).convert,
        sodium: Conversion.new(@sodium, BASE_UNITS[:weight]).convert,
        fiber: Conversion.new(@fiber, BASE_UNITS[:weight]).convert,
        sugars: Conversion.new(@sugars, BASE_UNITS[:weight]).convert
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
      Conversion.new(@serving, serving_unit).convert
    end

    def build_nutrients
      ::Nutrients.create(nutrient_params)
    end

    def nutrient_params
      converted_nutrients.inject({ product: @product }) do |result, element|
        name = element[0]
        conversion = element[1]
        result["#{name}_base_value".to_sym] = conversion.try(:scalar)
        result["#{name}_base_unit".to_sym] = conversion.try(:units)
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
  end
end

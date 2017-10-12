module Builder
  class Product
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
        product = build_product
        build_brands(product)
        build_ingredients(product)
        product
      end
    end

    private

    def build_product
      ::Product.create(
        barcode: @barcode,
        name: @name,
        serving: Conversion.new(@serving, serving_type).convert,
        serving_weight: @serving_weight,
        energy: Conversion.new(@energy, :energy).convert,
        proteins: Conversion.new(@proteins, :weight).convert,
        carbohydrates: Conversion.new(@carbohydrates, :weight).convert,
        fat: Conversion.new(@fat, :weight).convert,
        sodium: Conversion.new(@sodium, :weight).convert,
        fiber: Conversion.new(@fiber, :weight).convert,
        sugars: Conversion.new(@sugars, :weight).convert,
        source: @source
      )
    end

    def build_brands(product)
      built_brands = @brands.map do |name|
        ::Brand.find_or_create_by(name: name)
      end
      product.brands << built_brands
    end

    def build_ingredients(product)
      built_ingredients = @ingredients.map do |name|
        ::Ingredient.find_or_create_by(name: name)
      end
      product.ingredients << built_ingredients
    end

    def serving_type
      @serving_weight ? :weight : :volume
    end
  end
end

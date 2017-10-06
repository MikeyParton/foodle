module OpenFood
  class Product
    def initialize(args)
      parse(args)
      self
    end

    def parse(args)
      @code = args['code']
      @name =args.dig('product', 'product_name')
      @brands = args.dig('product', 'brands')
      @ingredients = args.dig('product', 'ingredients')
      @nutrition_information = args.dig('product', 'nutriments')
      @categories = args.dig('product', 'categories_tags')
      @serving_size = args.dig('product', 'serving_size')
      @serving_quantity = args.dig('product', 'serving_quantity')
    end

    def save
      brands = @brands.map do { |brand| Brand.create(name: brand) }
      ingredients = @ingredients.map do { |ingredient| Ingredient.create(name: 'ingredient') }
      product = Product.create(name: @name, barcode: @code, brands: @brands )
      nutritional_info = NutritionInformation.create(product: product)
      @nutrition_information.map do
        NutritionInformationRow.create()
      end
    end
  end
end

module OpenFood
  class Product
    attr_accessor :code, :product_name, :brands, :ingredients, :nutriments,
                  :categories_tags, :serving_size, :serving_size

    def initialize(args)
      product = args['product']
      @code = args['code']
      @product_name = product['product_name']
      @brands = product.fetch('brands', '')
      @ingredients = product.fetch('ingredients', [])
      @nutriments = product.fetch('nutriments', [])
      @categories_tags = product.fetch('categories_tags', [])
      @serving_size = product['serving_size']
      self
    end

    def save
      Builder::Product.new(builder_params).save
    end

    private

    def builder_params
      {
        barcode: code,
        name: product_name,
        brands: brands.split(','),
        ingredients: ingredients_params,
        serving: serving_size,
        energy: nutrient_param('energy'),
        proteins: nutrient_param('proteins'),
        carbohydrates: nutrient_param('carbohydrates'),
        fat: nutrient_param('fat'),
        sodium: nutrient_param('sodium'),
        fiber: nutrient_param('fiber'),
        sugars: nutrient_param('sugars'),
        source: 'open_food'
      }
    end

    def nutrient_param(name)
      value = nutriments["#{name}_100g"]
      unit = nutriments["#{name}_unit"]
      return nil unless [value, unit].all?(&:present?)
      [value, unit].join(' ')
    end

    def ingredients_params
      ingredients.map { |row| row['text'] }
    end
  end
end

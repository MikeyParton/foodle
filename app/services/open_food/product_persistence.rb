module OpenFood
  module ProductPersistence
    def save
      product = build_product
      build_brands(product)
      build_ingredients(product)
      build_nutrients(product)
      product
    end

    def build_product
      ::Product.create(
        barcode: code,
        name: product_name,
        serving_value: serving_quantity,
        serving_unit: serving_unit
      )
    end

    def build_brands(product)
      built_brands = brands.split(',').map do |name|
        ::Brand.find_or_create_by(name: name)
      end
      product.brands << built_brands
    end

    def build_ingredients(product)
      built_ingredients = ingredients.map do |row|
        ::Ingredient.find_or_create_by(name: row['text'])
      end
      product.ingredients << built_ingredients
    end

    def build_nutrients(product)
      Nutrient.names.keys.each do |name|
        ::Nutrient.create(
          product: product,
          name: name,
          value: nutriments["#{name}_100g"],
          unit: nutriments["#{name}_unit"].downcase
        )
      end
    end

    def serving_unit
      # serving size comes with units '30g'
      # serving quantity only has the value '30'
      serving_size.gsub(serving_quantity.to_s, '')
    end
  end
end

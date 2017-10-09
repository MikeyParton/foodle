module OpenFood
  class Product
    include OpenFood::ProductPersistence

    attr_accessor :product_name,
                  :code,
                  :brands,
                  :ingredients,
                  :nutriments,
                  :serving_size,
                  :serving_quantity,
                  :categories_tags

    def initialize(args)
      product = args['product']
      @code = args['code']
      @product_name = product['product_name']
      @brands = product.fetch('brands', '')
      @ingredients = product.fetch('ingredients', [])
      @nutriments = product.fetch('nutriments', [])
      @categories_tags = product.fetch('categories_tags', [])
      @serving_size = product['serving_size']
      @serving_quantity = product['serving_quantity']
      self
    end
  end
end

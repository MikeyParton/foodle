module OpenFood
  class Client
    require 'net/http'
    require 'uri'

    def initialize
      @client = Net::HTTP
      self
    end

    def barcode_search(code)
      uri = URI("https://world.openfoodfacts.org/api/v0/product/#{code}.json")
      response = JSON.parse(@client.get(uri))
      return { error: "Product not found" } if response["status"] == 0
      OpenFood::Product.new((response))
    end
  end
end

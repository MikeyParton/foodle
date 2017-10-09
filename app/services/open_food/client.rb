module OpenFood
  class Client
    require 'net/http'
    require 'uri'

    def initialize
      @client = Net::HTTP
      self
    end

    def product(code)
      uri = URI("https://world.openfoodfacts.org/api/v0/product/#{code}.json")
      response = @client.get(uri)
      response = JSON.parse(response)
      return nil if response["status"] == 0
      OpenFood::Product.new((response))
    end
  end
end

class ProductFinder
  def initialize(barcode)
    @barcode = barcode
  end

  def process
    return nil unless valid_barcode?
    product = Product.find_by(barcode: @barcode)
    return product if product.present?
    openfood_product = OpenFood::Client.new.scan(@barcode)
    return openfood_product.save if openfood_product.present?
    nil
  end

  private

  def valid_barcode?
    # is a 13 digit integer
    @barcode.match(/^(\d)+$/).present? && @barcode.length == 13
  end
end
